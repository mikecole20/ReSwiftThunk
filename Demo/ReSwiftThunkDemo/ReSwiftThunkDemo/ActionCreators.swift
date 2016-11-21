//
//  ActionCreators.swift
//  ReSwiftThunkDemo
//
//  Created by Mike Cole on 11/21/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk

class ActionCreators {
    
    static func login(validCredentials: Bool) -> ThunkAction {
        return ThunkAction(
            action: { (dispatch, getState) in
                let result = dispatch(ActionLogin())
                
                // Here we just wait two seconds and then call success or failure based on the validCredentials boolean.
                // Normally the login method would take email and password, perform some network request, and then call
                // success or failure actions based on the resposne.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    if validCredentials {
                        _ = dispatch(ActionLoginSuccess())
                    } else {
                        _ = dispatch(ActionLoginFailure(error: "Bad credentials"))
                    }
                })
                
                // You can return whatever you'd like here. I prefer using PromiseKit to wrap my async calls in a Promise.
                // Then my views can get the success or failure from the promise and perform side effects (navigation, for example).
                return result
        }
        )
    }
    
    static func logout() -> Action {
        return ActionLogout()
    }
    
}
