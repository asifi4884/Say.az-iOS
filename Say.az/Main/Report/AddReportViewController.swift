//
//  AddReportViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/9/21.
//
import UIKit

class AddReportViewController: CustomNavigationBarVC {

    @IBOutlet fileprivate var fields: [UIView]!
    @IBOutlet weak var typeOfReport: DropdownInputView! {
        didSet {
            typeOfReport.list = ["report.type.0".localize(),
                                 "report.type.1".localize(),
                                 "report.type.2".localize()]
        }
    }
    override func viewDidLoad() {
     setTitle("")

    }
}
