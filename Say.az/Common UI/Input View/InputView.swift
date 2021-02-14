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
            txtField.addTarget(self, action: #selector(editinChanged(_:)), for: .editingChanged)
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
    @IBOutlet weak var errorContainer: UIView! {
        didSet {
            errorContainer.isHidden = true
        }
    }
    @IBOutlet private weak var errorbl: UILabel!
    @IBOutlet private weak var errorContainerBottom: NSLayoutConstraint! {
        didSet {
            errorContainerBottom.constant = -34
        }
    }
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var rightSelectionBtn: UIButton! {
        didSet {
            rightSelectionBtn.isHidden = true
        }
    }
    @IBOutlet weak var roundedView: UIView! {
        didSet {
            roundedView.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            roundedView.layer.cornerRadius = 14
            roundedView.layer.borderWidth = 2
        }
    }

    var textFormat: String?

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

    @IBInspectable
    var localizedError: String = "" {
        didSet {
            errorbl.text = localizedError.localize()
        }
    }
    var type: FieldType = .none {
        didSet {
            switch type {
            case .email:
                txtField.keyboardType = .emailAddress
            case .password:
                txtField.isSecureTextEntry = true
            case .card_no, .cvv, .card_expire_date, .number(_):
                txtField.keyboardType = .numberPad
            case .none, .text(_):
                break
        }
        }
        
    }

    var text: String {
        return txtField.text ?? ""
    }
    var isValid = false

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
        hideError()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if !text.isEmpty { return }
        textField.placeholder = localizedPlaceHolder.localize()
        animateTitleDown()
    }


    @objc func editinChanged(_ textField: UITextField) {
       hideError()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        if let format = textFormat {
            textField.text = Helper.format(with: format, text: newString)
            return false
        }
        return true
    }

    func showError() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut]) {
            self.errorContainerBottom.constant = 0
            self.errorContainer.isHidden = false
            
            self.layoutIfNeeded()
        } completion: { (_) in

        }
    }

    func hideError() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut]) {
            self.errorContainerBottom.constant = -34
            self.errorContainer.isHidden = true
            self.layoutIfNeeded()
        } completion: { (_) in

        }
    }


    func validate() -> Bool {
         isValid = FieldValidator.shared.validate(type: type, text: self.text)
        isValid ? hideError() : showError()
        return isValid
    }
}
