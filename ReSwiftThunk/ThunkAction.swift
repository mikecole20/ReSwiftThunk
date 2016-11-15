//
//  ThunkAction.swift
//  ReSwiftThunk
//
//  Created by Mike Cole on 11/15/16.
//  Copyright © 2016 iOS Mike. All rights reserved.
//

import ReSwift

public struct ThunkAction: Action {
    var action: (@escaping ReSwift.DispatchFunction, @escaping ReSwift.GetState) -> Any
}
