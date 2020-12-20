//
//  CustomNavigationBarVC.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class CustomNavigationBarVC: UIViewController {

    @IBInspectable
    var navTitle: String = ""
    private lazy var customNavBar = BigButtonNavBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navController = navigationController else { return }
        navController.navigationBar.tintColor = .clear
        for view in navController.navigationBar.subviews {
            if let _ = view as? BigButtonNavBar { return }
        }
        customNavBar.titleLbl.text = navTitle
        customNavBar.frame = navController.navigationBar.frame
        customNavBar.backAction = { self.navigationController?.popViewController(animated: true) }
        navController.navigationBar.addSubview(customNavBar)
    }
    

   

}
