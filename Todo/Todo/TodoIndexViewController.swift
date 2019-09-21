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

public final class TodoIndexViewController: UIViewController, Instantiatable {

    private var input: Input
    public typealias Input = TodoIndexViewControllerRequest.Input
    public typealias Environment = EnvironmentProvider
    public var environment: Environment
    
    public init(with input: Input, environment: Environment){
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
            environment.userDefaultsDataStore.setTodos(newValue.map {[$0.name, $0.memo]} )
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
        navigationItem.setRightBarButtonItems([editButtonItem, addButton], animated: true)
    }

    private func tableViewSetup() {
        todoIndexView.setup()
        todoIndexView.todoItemTable.delegate = self
        todoIndexView.todoItemTable.dataSource = self
        CustomTodoItemCell<TodoItemTableCell>.register(to: todoIndexView.todoItemTable)
    }


    @objc fileprivate func segueToAdd() {
        let vc = environment.apply(TodoAddViewControllerRequest()).viewController
        navigationController?.pushViewController(vc, animated: true)
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = environment.apply(
                TodoShowViewControllerRequest(
                    TodoShowViewControllerRequest.Input(todo: todos[indexPath.row])
                )
            ).viewController
        navigationController?.pushViewController(vc, animated: true)
    }

    public override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        todoIndexView.todoItemTable.isEditing = editing
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todos.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}

extension CustomTodoItemCell where T:TodoItemTableCell {
    func setup(_ todo: Todo) {
        content.setup(todo)
    }
}
