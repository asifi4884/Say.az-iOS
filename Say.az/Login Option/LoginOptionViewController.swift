//
//  LoginOptionViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

class LoginOptionViewController: CustomNavigationBarVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}


extension LoginOptionViewController {
    @IBAction func asanPassBtnTapped() {
        guard let vc = LoginViewController().initialize(fromSb: .login) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func asanLoginBtnTapped() {
        guard let vc = LoginViewController().initialize(fromSb: .login) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func resgiterBtnTapped() {
        guard let vc = RegisterFirstViewController().initialize(fromSb: .login) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
