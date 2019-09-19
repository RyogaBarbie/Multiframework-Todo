//
//  ViewControllerProvider.swift
//  AppCore
//
//  Created by YamamuraRyoga on 2019/09/11.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation

public protocol ViewControllerProvider {
    func apply(_ request: TodoIndexViewControllerRequest) -> TodoIndexViewControllerRequest.EnvironmentResponse
    func apply(_ request: TodoShowViewControllerRequest) -> TodoShowViewControllerRequest.EnvironmentResponse
}
