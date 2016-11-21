//
//  AppReducer.swift
//  ReSwiftThunkDemo
//
//  Created by Mike Cole on 11/21/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

struct AppReducer: Reducer {
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState()
        
        switch action {
            
        case _ as ActionLogin:
            state.loggingIn = true
            state.loginError = nil
            
        case _ as ActionLoginSuccess:
            state.loggedIn = true
            state.loggingIn = false
            
        case let action as ActionLoginFailure:
            state.loggingIn = false
            state.loginError = action.error
            
        case _ as ActionLogout:
            state = AppState()
            
        default:
            break
        }
        
        return state
    }
    
}
