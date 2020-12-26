//
//  NoIncomesViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/26/20.
//

import UIKit

class NoBankAccountsViewController: CustomNavigationBarVC {


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

    @IBAction func addBankCardBtnTapped() {
        let vc = AddAccountViewController().initialize(fromSb: .bank_account)!
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
