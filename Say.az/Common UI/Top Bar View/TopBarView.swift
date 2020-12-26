//
//  TopBarView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class TopBarView: UIView, UITextFieldDelegate {


    @IBOutlet weak var iconImgView: UIImageView! {
        didSet {
            iconImgView.layer.cornerRadius = 14
        }
    }
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var bottomLbl: UILabel!
    @IBOutlet weak var containerView: UIView!

    var phoneNumAction: (() -> Void)!
    var notifAction: (() -> Void)!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initNib()
    }

    private func initNib() {
        let name = "TopBarView"
        let nib = UINib(nibName: name, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    }

    @IBAction func phoneBtnTapped() {
        phoneNumAction()
    }

    @IBAction func notifBtnTapped() {
        if let notifAction = notifAction {
            notifAction()
        }

    }
}
