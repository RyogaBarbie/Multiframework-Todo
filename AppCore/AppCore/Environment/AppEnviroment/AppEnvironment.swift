//
//  AppEnvironment.swift
//  MultiFramework-Todo
//
//  Created by YamamuraRyoga on 2019/09/11.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public final class AppEnvironment {
    public var userDefaultsDataStore: UserDefaultsDataStore
    
    public init(userDefaults: UserDefaultsProtocol = UserDefaults.standard){
        self.userDefaultsDataStore = UserDefaultsDataStore(userDefaults: userDefaults)
    }
}
