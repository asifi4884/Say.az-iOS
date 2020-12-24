//
//  CustomTableViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/23/20.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modifyTabbarAppearance()

    }
    func modifyTabbarAppearance() {

        let view = TopCorneredView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false

        self.tabBar.isTranslucent = false
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        self.tabBar.insertSubview(view, at: 0)

        view.topAnchor.constraint(equalTo: self.tabBar.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.tabBar.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.tabBar.trailingAnchor).isActive = true

    }
    
}
