//
//  Injectable.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/20.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

public protocol Injectable {
    associatedtype Input
    func input(_ input: Input)
}

public extension Injectable where Input == Void {
    func input(_ input: Input){}
}
