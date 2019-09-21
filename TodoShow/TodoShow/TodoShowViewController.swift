//
//  TodoShowViewController.swift
//  Todo
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import AppCore
import AppBundle
import Entity

public final class TodoShowViewController: UIViewController, Instantiatable {
    
    private var input: Input
    public typealias Input = TodoShowViewControllerRequest.Input
    public typealias Environment = EnvironmentProvider
    public var environment: Environment
    
    public init(with input: Input, environment: Environment) {
        self.environment = environment
        self.input = input
        self.todo = input.todo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var todoShowView = TodoShowView(frame: .zero)
    
    var todo: Todo
    
    public override func loadView() {
        view = todoShowView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        todoShowView.setup(todo)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "TodoNAme"
    }
}
