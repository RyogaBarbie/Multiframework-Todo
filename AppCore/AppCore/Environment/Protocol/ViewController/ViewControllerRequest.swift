//
//  ViewControllerRequest.swift
//  AppCore
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewControllerRequest: EnvironmentRequest where EnvironmentResponse == ViewControllerResponse {
    associatedtype EnvironmentResponse = ViewControllerResponse
}

extension ViewControllerRequest {
    public func response<V>(for type: V.Type, environment: V.Environment) -> ViewControllerResponse where V: UIViewController, V: Instantiatable {
        let viewController = V(environment: environment)
        return ViewControllerResponse(viewController: viewController)
    }
}
