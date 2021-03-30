//
//  AddAccountViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class AddAccountViewController: CustomNavigationBarVC {

    @IBOutlet weak var cardNo: InputView! {
        didSet {
            cardNo.type = .card_no
            cardNo.textFormat = "XXXX XXXX XXXX XXXX"
        }
    }
    @IBOutlet weak var cardExpireDate: InputView! {
        didSet {
            cardExpireDate.type = .card_expire_date
            cardExpireDate.textFormat = "XX/XX"
        }
    }
    @IBOutlet weak var cardCVV: InputView! {
        didSet {
            cardCVV.type = .cvv
            cardCVV.textFormat = "XXX"
            cardCVV.txtField.isSecureTextEntry = true
        }
    }

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
        if runValidation(cardNo, cardExpireDate, cardCVV) {
            Storage.hasBankAccounts = true
            Storage.bankCards.append("m_\(cardNo.text)")
            self.navigationController?.popViewController(animated: true)
        }
    }


}
