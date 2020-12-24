//
//  ViewController+Extension.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/23/20.
//

import UIKit


extension UIViewController {

    func initialize(fromSb SBName: SBName) -> Self? {
        let sb = UIStoryboard(name: SBName.rawValue, bundle: nil)
        let vcId = String(describing: type(of: self))
        let viewController = sb.instantiateViewController(withIdentifier: vcId)

        return (viewController as? Self) ?? nil
        }

    //Custom Alert controller display
    func showAlert(with message: String, preferredStyle: UIAlertController.Style = .alert, actions: [(title: String,style: UIAlertAction.Style)] = [("OK", .default)], completion: ((_ at: Int, _ type: UIAlertAction) -> Void)? = nil) {

        let alert = UIAlertController(title: nil, message: message, preferredStyle: preferredStyle)

        for (index, action) in actions.enumerated() {
            let action = UIAlertAction(title: action.title, style: action.style) { (action) in
                completion?(index, action)
            }
            alert.addAction(action)
        }

        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }



}
