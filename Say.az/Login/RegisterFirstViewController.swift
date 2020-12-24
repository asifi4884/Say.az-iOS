//
//  RegisterFirstViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

class RegisterFirstViewController: CustomNavigationBarVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension RegisterFirstViewController {
    @IBAction func nextBtnTapped() {
        //TODO: Check validation

        guard let vc = RegisterSecondViewController().initialize(fromSb: .login) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
