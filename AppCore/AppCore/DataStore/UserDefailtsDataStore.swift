//
//  UserDefailtsDataStore.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/15.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation
import Entity

public final class UserDefaultsDataStore: DataStore {
    private let userDefaults: UserDefaultsProtocol

    public init(userDefaults: UserDefaultsProtocol){
        self.userDefaults = userDefaults
    }

    enum Key: String {
        case todo
    }
    
    func value<T>(of type: T.Type = T.self, for key: UserDefaultsDataStore.Key) -> T? where T : Decodable {
        return userDefaults.object(forKey: key.rawValue) as? T
    }
    func setValue<T>(_ value: T?, for key: UserDefaultsDataStore.Key) where T : Encodable {
        userDefaults.set(value, forKey: key.rawValue)
    }
}

extension UserDefaultsDataStore {

    public var todos: [Todo] {
        var todos = [Todo]()
        guard let values: [[String]] = value(for: .todo) else { return todos }
        for value in values {
            todos.append(Todo(name: value[0], memo: value[1]))
        }
        return todos
    }

    public func setTodos(_ newValues: [[String]]){
        setValue(newValues, for: .todo)
    }
}
