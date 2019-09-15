//
//  DataStoreProvider.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/15.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public protocol DataStoreProvider {
    var userDefaultsDataStore: UserDefaultsDataStore { get }
}
