//
//  UserDefautlsDataStoreTests.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/21.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import XCTest
import Entity
@testable import AppCore

class UserDefaltsDataStoreTests: XCTestCase {
    override func setUp(){
        super.setUp()
    }
    override func tearDown(){
        super.tearDown()
    }
    
    func testTodo(){
        let userDefaultsDataStore = UserDefaultsDataStore(userDefaults: UserDefaultsMock())
        var todos = [Todo]()
        XCTAssertEqual(todos, userDefaultsDataStore.todos)
        todos = [Todo(name: "洗濯", memo: "昼までに"), Todo(name: "掃除", memo: "クイックルワイパーかける")]
        userDefaultsDataStore.setTodos(todos.map {[$0.name, $0.memo]} )
        XCTAssertEqual("洗濯", userDefaultsDataStore.todos[0].name)
        XCTAssertEqual("クイックルワイパーかける", userDefaultsDataStore.todos[1].memo)
    }
}
