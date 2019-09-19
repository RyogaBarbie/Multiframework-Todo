//
//  CustomTodoItemCell.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//
import UIKit

public class CustomTodoItemCell<T: UIView>: UITableViewCell {
    internal static var reuseIdentifier: String {
        return String(describing: ObjectIdentifier(T.self).hashValue)
    }
    
    public let content = T(frame: .zero)
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(content)
        content.frame = contentView.bounds
    }
    
    public static func register(to tableView: UITableView) {
        tableView.register(CustomTodoItemCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    public static func dequeued(from tableView: UITableView, for indexPath: IndexPath) -> CustomTodoItemCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTodoItemCell.reuseIdentifier, for: indexPath) as! CustomTodoItemCell
        return cell
    }
}
