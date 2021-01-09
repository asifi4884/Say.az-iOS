//
//  ReportContainerViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/9/21.
//

import UIKit

class ReportContainerViewController: CustomNavigationBarVC {

    @IBOutlet var containerViews: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
//        showContent()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

//    private func showContent() {
//        if Storage.hasBankAccounts {
//            containerViews[0].isHidden = true
//            containerViews[1].isHidden = false
//        } else {
//            containerViews[0].isHidden = false
//            containerViews[1].isHidden = true
//        }
//    }

}
