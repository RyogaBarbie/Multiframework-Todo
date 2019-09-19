//
//  TodoAddView.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/08/25.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit

public class TodoAddView: UIView {
    @IBOutlet public weak var view: UIView! {
        didSet {
            view.frame = bounds
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    @IBOutlet public weak var todoNameTextfield: UITextField!
    @IBOutlet public weak var todoMemoTextField: UITextField!
    @IBOutlet public weak var addButton: UIButton!

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
}
