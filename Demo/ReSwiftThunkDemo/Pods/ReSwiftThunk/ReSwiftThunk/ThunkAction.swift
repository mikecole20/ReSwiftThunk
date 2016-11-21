//
//  ThunkAction.swift
//  ReSwiftThunk
//
//  Created by Mike Cole on 11/15/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

public struct ThunkAction: Action {
    
    public var action: (@escaping ReSwift.DispatchFunction, @escaping ReSwift.GetState) -> Any
    
    public init(action: @escaping (@escaping ReSwift.DispatchFunction, @escaping ReSwift.GetState) -> Any) {
        self.action = action
    }
    
}
