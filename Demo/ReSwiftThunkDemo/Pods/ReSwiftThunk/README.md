# ReSwiftThunk
A thunk middleware for [ReSwift](https://github.com/ReSwift/ReSwift).

## Installation

Add `ReSwiftThunk` to your project using Cocoapods.
```
pod 'ReSwiftThunk', '~> 0.1'
```

## Usage
Include the `ThunkMiddleware` when you create your ReSwift store.
```
let mainStore = Store<AppState>(
    reducer: AppReducer(),
    state: nil,
    middleware: [ThunkMiddleware]
)
```

Extend `ThunkAction` to define your asyncronous actions. Usually, they will dispatch regular `Action`s inside. I like to use functions to create the `ThunkAction`.
```
struct ActionRestPassword: Action {
}

struct ActionResetPasswordSuccess: Action {
}

struct ActionResetPasswordFailure: Action {
    var error: Error
}

public func resetPassword(email: String) -> ThunkAction {
    return ThunkAction(
        action: { (dispatch, getState) in
            _ = dispatch(ActionRestPassword())

            let result = self.bellhopsSessionManager.request(Router.resetPassword(email: email)).validate().responseJSON()

            return result.then { resp -> Any in
                _ = dispatch(ActionResetPasswordSuccess())
                return resp
            }.recover { error -> Any in
                _ = dispatch(ActionResetPasswordFailure(error: error))
                throw error
            }
        }
    )
}

```
> Note that in this example, I am using [PromiseKit](https://github.com/mxcl/PromiseKit) so that the action returns a promise. This makes side effects in your views easy.

Then dispatch the ThunkAction.
```
let action = resetPassword(email: "email@gmail.com")
let result = mainStore.dispatch(action)
if let promise = result as? Promise<Any> {
    promise.then { resp -> Void in
        print("success")
    }.catch { error in
        print("failure")
    }
}
mainStore.dispatch
```
> Once again, this example is using promises. You can return anything you want though, because ReSwift only requires a return of `Any`.
