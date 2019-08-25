//
//  ClassNameProtocol.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
