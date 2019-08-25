//
//  TodoAddViewController.swift
//  Todo
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import AppBundle
import Entity

private extension Selector {
    static let addButtonPushed = #selector(TodoAddViewController.addButtonPushed)
}

class TodoAddViewController: UIViewController {

    lazy var todoAddView = TodoAddView(frame: .zero)

    override func loadView() {
        view = todoAddView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        todoAddView.addButton.addTarget(self, action: .addButtonPushed, for: .touchUpInside)
    }
    private func setupNavigationBar() {
        navigationItem.title = "追加"
    }
    
    @objc fileprivate func addButtonPushed() {
        guard let nvc = navigationController, let indexVc = nvc.viewControllers[nvc.viewControllers.count - 2] as? TodoIndexViewController, let newTodo = todoAddView.todoNameTextfield.text else { return }
        let todo = Todo.init(name: newTodo)
        indexVc.todos.append(todo)
        indexVc.todoIndexView.todoItemTable.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
