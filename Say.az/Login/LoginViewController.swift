//
//  LoginViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/19/20.
//

import UIKit

class LoginViewController: CustomNavigationBarVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtnTapped() {
        //TODO: action to login
        Storage.isLogged = true
        let vc = CustomTabBarController().initialize(fromSb: .home)!
        Helper.shared.makeRoot(vc)
    }

}
