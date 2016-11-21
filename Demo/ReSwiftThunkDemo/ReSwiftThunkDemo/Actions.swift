//
//  Actions.swift
//  ReSwiftThunkDemo
//
//  Created by Mike Cole on 11/21/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

struct ActionLogin: Action {
}

struct ActionLoginSuccess: Action {
}

struct ActionLoginFailure: Action {
    var error: String
}

struct ActionLogout: Action {
}
