//
//  ThunkAction.swift
//  ReSwiftThunk
//
//  Created by Mike Cole on 11/15/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

public struct ThunkAction<State>: Action {
    
    public var action: (@escaping DispatchFunction, @escaping () -> State?) -> Void
    
    public init(action: @escaping (@escaping DispatchFunction, @escaping () -> State?) -> Void) {
        self.action = action
    }
    
}
