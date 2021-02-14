//
//  FieldValidator.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/24/21.
//

import Foundation

class FieldValidator {
    static let shared = FieldValidator()

    private init() {}

    func validate(type: FieldType, text: String?) -> Bool {
        switch type {
        case .password:
            return isValidPassword(text)
        case .text(let range):
            return isValidText(range: range, text)
        case .number(let range):
            return isValidText(range: range, text)
        case .email:
            return isValidEmail(text)
        case .card_no:
            return isValidText(range: (16, 16), text)
        case .cvv:
            return isValidText(range: (3, 3), text)
        case .card_expire_date:
            return isValidText(range: (5, 5), text)
        case .none:
            return true
        }
    }


    private func isValidPassword(_ text: String?) -> Bool {
        guard let text = text, !text.isEmpty else {
            return false
        }
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: text)
    }

    private func isValidText(range: (lowerBound: Int, upperBound: Int)?,_ text: String?) -> Bool {
        guard let text = text?.replacingOccurrences(of: " ", with: ""), !text.isEmpty else {
            return false
        }

        if let range = range {
            if text.count >= range.lowerBound, text.count <= range.upperBound {
                return true
            }
        }
        return false
    }

    private func isValidEmail(_ text: String?) -> Bool {
        guard let text = text, !text.isEmpty else {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text)
    }

}


enum FieldType {

    case email
    case text(_ range: (lowerBound: Int, upperBound: Int)?)
    case number(_ range: (lowerBound: Int, upperBound: Int)?)
    case password
    case card_no
    case card_expire_date
    case cvv
    case none
}
