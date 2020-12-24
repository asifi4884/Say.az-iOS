//
//  InputView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/19/20.
//

import UIKit

class InputView: UIView, UITextFieldDelegate {

    @IBOutlet weak var txtField: UITextField! {
        didSet {
            txtField.delegate = self
        }
    }
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var titleContainer: UIView! {
        didSet {
            titleContainer.alpha = 0.0
            titleContainer.transform = CGAffineTransform(translationX: 0, y: 10)
        }
    }
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var roundedView: UIView! {
        didSet {
            roundedView.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            roundedView.layer.cornerRadius = 14
            roundedView.layer.borderWidth = 2
        }
    }


    @IBInspectable
    var icon: UIImage = UIImage() {
        didSet {
            iconImgView.tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            iconImgView.image = icon.withRenderingMode(.alwaysTemplate)
        }
    }
    @IBInspectable
    var localizedPlaceHolder: String = "" {
        didSet {
            txtField.placeholder = localizedPlaceHolder.localize()
            titleLbl.text = localizedPlaceHolder.localize()
        }
    }

    var text: String {
        return txtField.text ?? ""
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initNib()
    }

    private func initNib() {
        let name = "InputView"
        let nib = UINib(nibName: name, bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    }

    func animateTitleDown() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.titleContainer.transform = CGAffineTransform(translationX: 0, y: 10)
            self.titleContainer.alpha = 0.0
        }

    }

    func animateTitleUp() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.titleContainer.transform = .identity
            self.titleContainer.alpha = 1.0
        }
    }
}

extension InputView {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !text.isEmpty { return }
        textField.placeholder = nil
        animateTitleUp()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if !text.isEmpty { return }
        textField.placeholder = localizedPlaceHolder.localize()
        animateTitleDown()
    }
}
