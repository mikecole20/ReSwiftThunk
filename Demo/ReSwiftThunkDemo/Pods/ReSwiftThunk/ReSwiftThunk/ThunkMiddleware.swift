//
//  ThunkMiddleware.swift
//  ReSwiftThunk
//
//  Created by Mike Cole on 11/15/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

public let ThunkMiddleware: Middleware = { dispatch, getState in
    return { next in
        return { action in
            guard let thunk = action as? ThunkAction, let validDispatch = dispatch else {
                return next(action)
            }
            
            return thunk.action(validDispatch, getState)
        }
    }
}
