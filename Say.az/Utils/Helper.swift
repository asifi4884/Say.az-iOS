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


    static func format(with mask: String, text: String) -> String {
        let numbers = text.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}
