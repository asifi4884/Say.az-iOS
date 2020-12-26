//
//  CustomNavigationBarVC.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class CustomNavigationBarVC: UIViewController {
    
    private lazy var customNavBar = BigButtonNavBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navController = navigationController else { return }
        navController.navigationBar.tintColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        for view in navController.navigationBar.subviews {
            if let _ = view as? BigButtonNavBar { return }
        }
        
        customNavBar.frame = navController.navigationBar.frame
        customNavBar.backAction = { self.navigationController?.popViewController(animated: true) }
        navController.navigationBar.addSubview(customNavBar)
        
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.barTintColor = customNavBar.containerView.backgroundColor
    }
    
    func setTitle(_ string: String) {
        

        guard let navController = self.navigationController else { return }
        for view in navController.navigationBar.subviews {
            if let view = view as? BigButtonNavBar {
                view.titleLbl.text = string
                view.backButton.isHidden = !string.isEmpty

            }
        }
            }


   

}
