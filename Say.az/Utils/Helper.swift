//
//  Helper.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/24/20.
//

import UIKit

class Helper {
    static let shared: Helper = Helper()

    private init() {}



    func makeRoot(_ viewController: UIViewController) {
        let window = getWindow()

        window?.rootViewController = viewController
        UIView.transition(with: window!, duration: 0.2, options: .transitionCrossDissolve, animations: nil, completion: nil)

    }

    func getWindow() -> UIWindow? {

        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
            return  scene.window
        } else {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            return appdelegate.window
        }
    }
}
