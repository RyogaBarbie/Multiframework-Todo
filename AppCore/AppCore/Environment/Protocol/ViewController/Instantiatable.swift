//
//  Instantiatable.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public protocol Instantiatable {
    associatedtype Environment
    var environment: Environment { get }
    init(environment: Environment)
}

public extension Instantiatable {
    static func instantiate(environment: Environment) -> Self {
        return Self(environment: environment)
    }
}
