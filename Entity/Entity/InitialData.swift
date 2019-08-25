//
//  InitialData.swift
//  Entity
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public class InitialData {
    public static func create(_ todoNames: [String]) -> [Todo] {
        var todos = [Todo]()
        for todoName in todoNames {
            todos.append(Todo.init(name: todoName))
        }
        return todos
    }
}
