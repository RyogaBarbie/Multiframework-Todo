//
//  TodoIndexViewController.swift
//  Todo
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import AppBundle
import Entity

private extension Selector {
    static let segueToAdd = #selector(TodoIndexViewController.segueToAdd)
}

public final class TodoIndexViewController: UIViewController {

    lazy var todoIndexView = TodoIndexView(frame: .zero)
    var todos = [Todo]()

    public override func loadView() {
        view = todoIndexView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        dataSetup()
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

    private func dataSetup() {
        let initialTodoName = ["洗濯", "買い物", "掃除", "ご飯", "お風呂", "仕事", "電話", "翌日の準備"]
        todos = InitialData.create(initialTodoName)
    }

    @objc fileprivate func segueToAdd() {
        print("追加するよん")
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
