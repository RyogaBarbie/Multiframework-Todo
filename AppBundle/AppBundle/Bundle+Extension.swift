//
//  Bundle+Extension.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

private class DummyClass {}

public extension Bundle {
    static var appBundle: Bundle {
        return Bundle(for: DummyClass.self)
    }
}
