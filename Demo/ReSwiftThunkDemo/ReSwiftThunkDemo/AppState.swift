//
//  AppState.swift
//  ReSwiftThunkDemo
//
//  Created by Mike Cole on 11/21/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var loggingIn: Bool = false
    var loggedIn: Bool = false
    var loginError: String?
}
