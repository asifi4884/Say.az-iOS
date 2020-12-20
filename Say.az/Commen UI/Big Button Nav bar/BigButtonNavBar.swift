//
//  BigButtonNavBar.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class BigButtonNavBar: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBAction func backBtnTapped() {
        backAction()
    }

    var backAction: (() -> Void)!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initNib()
    }
    
    private func initNib() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
}
