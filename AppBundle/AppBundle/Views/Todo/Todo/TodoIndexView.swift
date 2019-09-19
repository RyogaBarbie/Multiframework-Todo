//
//  TodoIndexView.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import Foundation

public class TodoIndexView: UIView {
    @IBOutlet var view: UIView! {
        didSet {
            view.frame = bounds
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    @IBOutlet public weak var todoItemTable: UITableView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    private func loadNib() {
        let nib = UINib(nibName: className, bundle: Bundle.appBundle)
        nib.instantiate(withOwner: self, options: nil)
    }
    
    public func setup() {
        todoItemTable.tableFooterView = UIView(frame: .zero)
        todoItemTable.allowsSelectionDuringEditing = true
    }
}
