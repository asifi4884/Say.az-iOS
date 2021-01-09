//
//  DashboarContainerViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/8/21.
//

import UIKit

class DashboarContainerViewController: CustomNavigationBarVC {

    @IBOutlet var containerViews: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
}
