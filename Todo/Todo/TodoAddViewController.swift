//
//  TodoAddViewController.swift
//  Todo
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import AppCore
import AppBundle
import Entity

private extension Selector {
    static let addButtonPushed = #selector(TodoAddViewController.addButtonPushed)
}

public final class TodoAddViewController: UIViewController, Instantiatable {
 
    private var input: Input
    public typealias Input = TodoAddViewControllerRequest.Input
    public typealias Environment = EnvironmentProvider
    public var environment: Environment

    public init(with input: Input, environment: Environment){
        self.environment = environment
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var todoAddView = TodoAddView(frame: .zero)

    override public func loadView() {
        view = todoAddView
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        todoAddView.addButton.addTarget(self, action: .addButtonPushed, for: .touchUpInside)
    }
    private func setupNavigationBar() {
        navigationItem.title = "追加"
    }
    
    @objc fileprivate func addButtonPushed() {
        guard let nvc = navigationController, let indexVc = nvc.viewControllers[nvc.viewControllers.count - 2] as? TodoIndexViewController, let todoName = todoAddView.todoNameTextfield.text, let todoMemo = todoAddView.todoMemoTextField.text else { return }
        let todo = Todo.init(name: todoName, memo: todoMemo)
        indexVc.todos.append(todo)
        indexVc.todoIndexView.todoItemTable.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
