//
//  Instantiatable.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

public protocol Instantiatable {
    associatedtype Input
    associatedtype Environment
    var environment: Environment { get }
    init(with input: Input, environment: Environment)
}

public extension Instantiatable {
    static func instantiate(_ input: Input, environment: Environment) -> Self {
        return Self(with: input, environment: environment)
    }
}
public extension Instantiatable where Input == Void {
    static func instantiate(environment: Environment) -> Self {
        return Self(with: (), environment: environment)
    }
}
