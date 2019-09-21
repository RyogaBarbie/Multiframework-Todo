//
//  UserDefaultsMock.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/21.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import AppCore

public class UserDefaultsMock: UserDefaultsProtocol {
    public var dic: [String: Any] = [:]
    public init(){}
    
    public func object(forKey defaultName: String) -> Any? {
        return dic[defaultName]
    }
    public func set(_ value: Any?, forKey defaultName: String) {
        dic[defaultName] = value
    }
}
