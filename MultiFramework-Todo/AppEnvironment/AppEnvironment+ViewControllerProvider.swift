//
//  AppEnvironment+ViewControllerProvider.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/12.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation
import AppCore
import Todo
import TodoShow

extension AppEnvironment: AppCore.ViewControllerProvider {
    public func apply(_ request: TodoAddViewControllerRequest) -> TodoAddViewControllerRequest.EnvironmentResponse {
        return request.response(for: TodoAddViewController.self, environment: self)
    }
    
    public func apply(_ request: TodoIndexViewControllerRequest) -> TodoIndexViewControllerRequest.EnvironmentResponse {
        return request.response(for: TodoIndexViewController.self, environment: self)
    }
    public func apply(_ request: TodoShowViewControllerRequest) -> TodoShowViewControllerRequest.EnvironmentResponse {
        return request.response(for: TodoShowViewController.self, environment: self)
    }
}
