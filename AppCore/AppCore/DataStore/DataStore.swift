//
//  DataStore.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/15.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

protocol DataStore {
    associatedtype Key
    func value<T: Decodable>(of type: T.Type, for key: Key) -> T?
    func setValue<T: Encodable>(_ value: T?, for key: Key)
}
