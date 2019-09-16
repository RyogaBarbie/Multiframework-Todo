//
//  TodoIndexViewController.swift
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
    static let segueToAdd = #selector(TodoIndexViewController.segueToAdd)
}

public final class TodoIndexViewController: UIViewController {

    public typealias Environment = EnvironmentProvider
    public var environment: Environment
    
    public init(environment: Environment){
        self.environment = environment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var todoIndexView = TodoIndexView(frame: .zero)

    var todos: [Todo] {
        get {
            return environment.userDefaultsDataStore.todos
        }
        set {
            environment.userDefaultsDataStore.setTodos(newValue.map({$0.name}))
        }
    }

    public override func loadView() {
        view = todoIndexView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        tableViewSetup()
    }

    private func setupNavigationBar() {
        navigationItem.title = "ToDoリスト"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: .segueToAdd)
        navigationItem.setRightBarButton(addButton, animated: true)
    }

    private func tableViewSetup() {
        todoIndexView.setup()
        todoIndexView.todoItemTable.delegate = self
        todoIndexView.todoItemTable.dataSource = self
        CustomTodoItemCell<TodoItemTableCell>.register(to: todoIndexView.todoItemTable)
    }


    @objc fileprivate func segueToAdd() {
        let addView = TodoAddViewController(environment: environment)
        navigationController?.pushViewController(addView, animated: true)
    }
}


extension TodoIndexViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTodoItemCell<TodoItemTableCell>.dequeued(from: tableView, for: indexPath)
        cell.setup(todos[indexPath.row])
        return cell
    }
}

extension CustomTodoItemCell where T:TodoItemTableCell {
    func setup(_ todo: Todo) {
        content.setup(todo)
    }
}
