//
//  TodoShowView.swift
//  AppBundle
//
//  Created by 山村凌雅 on 2019/09/19.
//  Copyright © 2019 Yamamura Ryoga. All rights reserved.
//

import UIKit
import Entity

public class TodoShowView: UIView {
    @IBOutlet public weak var view: UIView! {
        didSet {
            view.frame = bounds
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    @IBOutlet public weak var todoMemoTextView: UITextView!
    
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
    
    public func setup(_ todo: Todo){
        todoMemoTextView.text = todo.memo
    }
}
