//
//  LocalizationOnStoryboard.swift
//
//  Created by Ulxan Emiraslanov on 10/28/19.


import UIKit

extension UIButton {
    @IBInspectable
        public var localizeTitle: String? {
            get {
                return nil
            }
            set(key) {
                setTitle(key?.localize(), for: .normal)
            }
        }
}


extension UILabel {
        @IBInspectable
        public var localizeText: String? {
            get {
                return nil
            }
            set(key) {
                text = key?.localize()
            }
        }
}


extension UITextField {
    @IBInspectable
        public var localizeText: String? {
            get { return nil }
            set(key) {
                text = key?.localize()
            }
        }
    
        @IBInspectable
        public var LocalizePlaceHolder: String? {
            get { return nil }
            set(key) { placeholder = key?.localize() }
        }
}

extension UIBarItem {
    @IBInspectable
        public var localizeTitle: String? {
            get {
                return nil
            }
            set(key) {
                title = key?.localize()
            }
        }
}
