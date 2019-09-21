//
//  Todo.swift
//  Entity
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public struct Todo: Equatable {
    public var name: String
    public var memo: String
    
    public init(name: String, memo: String) {
        self.name = name
        self.memo = memo
    }
}

