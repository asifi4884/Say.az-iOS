//
//  RegisterSecondViewController.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

class RegisterSecondViewController: CustomNavigationBarVC, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var photoImgView: UIImageView! {
        didSet {
            photoImgView.layer.cornerRadius = photoImgView.frame.height / 2
            photoImgView.addTapGestureRecognizer {
                let imgPicker = UIImagePickerController()
                imgPicker.delegate = self
                self.present(imgPicker, animated: true)
            }
        }
    }
    @IBOutlet weak var specialityView: DropdownInputView! {
        didSet {
            specialityView.list = ["Developer", "Designer", "Accountant", "HR"]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoImgView.image = image
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

}


extension RegisterSecondViewController {
    @IBAction func registerBtnTapped() {
        //TODO: Check validation

        guard let vc = BankSelectViewController().initialize(fromSb: .login) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
