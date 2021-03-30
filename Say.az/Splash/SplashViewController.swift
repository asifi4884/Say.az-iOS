//
//  SplashViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    //MARK: - Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //TODO: uncomment
        if (Storage.isLogged) {
            openVC(of: .home)
        } else {
            LocalizationManager.shared.setLanguage(languageCode: "az")
            openVC(of: .intro)
        }
    }
}


//MARK: - Methods(functions)
extension SplashViewController {
    func openVC(of type: SegueID) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.performSegue(withIdentifier: type.rawValue, sender: nil)
        }
    }
}

//MARK: - IBActions
extension SplashViewController {
    
}
