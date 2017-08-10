//
//  ThunkMiddleware.swift
//  ReSwiftThunk
//
//  Created by Mike Cole on 11/15/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

public let ThunkMiddleware: Middleware<StateType> = { dispatch, getState in
    return { next in
        return { action in
            guard let thunk = action as? ThunkAction<StateType> else {
                return next(action)
            }
            
            return thunk.action(dispatch, getState)
        }
    }
}
