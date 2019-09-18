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

extension AppEnvironment: AppCore.ViewControllerProvider {
    public func apply(_ request: TodoIndexViewControllerRequest) -> TodoIndexViewControllerRequest.EnvironmentResponse {
        return request.response(for: TodoIndexViewController.self, environment: self)
    }
}
