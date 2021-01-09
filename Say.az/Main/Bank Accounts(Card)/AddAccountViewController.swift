//
//  AddAccountViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class AddAccountViewController: CustomNavigationBarVC {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTitle("add.new.bank.account.title".localize())
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    @IBAction func addBtnTapped() {
        //TODO: make req and other stuffs
        Storage.hasBankAccounts = true
        self.navigationController?.popViewController(animated: true)
    }


}
