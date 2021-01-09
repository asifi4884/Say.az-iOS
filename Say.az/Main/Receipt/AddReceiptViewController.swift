//
//  AddReceiptViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/9/21.
//

import UIKit

class AddReceiptViewController: CustomNavigationBarVC {

    @IBOutlet fileprivate var fields: [UIView]!
    @IBOutlet weak var typeOfReceipt: DropdownInputView! {
        didSet {
            typeOfReceipt.list = ["receipt.with.voen.title".localize(),
                                  "receipt.without.voen.title".localize()]
        }
    }
    override func viewDidLoad() {
     setTitle("")

    }
}
