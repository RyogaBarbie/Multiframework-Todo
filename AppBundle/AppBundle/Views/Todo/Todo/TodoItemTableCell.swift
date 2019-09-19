//
//  TodoItemTableCell.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import Foundation
import Entity

public class TodoItemTableCell: UIView {
    @IBOutlet var view: UIView! {
        didSet {
            view.frame = bounds
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    @IBOutlet weak var todoNameLabel: UILabel!

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
    
    public func setup(_ todo: Todo) {
        todoNameLabel.text = todo.name
    }
}
