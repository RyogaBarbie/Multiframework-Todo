//
//  ViewControllerRequests.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation
import Entity

public struct TodoIndexViewControllerRequest: ViewControllerRequest {
    public var inputValue: Void
    public typealias Input = Void
    
    public init(){}
}

public struct TodoShowViewControllerRequest: ViewControllerRequest {
    public var inputValue: Input
    public struct Input {
        public let todo: Todo
        
        public init(todo: Todo){
            self.todo = todo
        }
    }
    public init(_ input: Input){
        self.inputValue = input
    }
}
