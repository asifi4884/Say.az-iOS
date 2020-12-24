//
//  SimpleCardView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/23/20.
//

import UIKit

    class SimpleCardView: UIView {

        @IBOutlet weak var iconImgView: UIImageView!
        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var leftTitleLbl: UILabel! {
            didSet {
                leftTitleLbl.text = ""
            }
        }
        @IBOutlet weak var containerView: UIView!

        @IBInspectable var icon: UIImage = UIImage() {
            didSet {
                iconImgView.image = icon
            }
        }
        @IBInspectable var title: String = "" {
            didSet {
                titleLbl.text = title.localize()
            }
        }

        @IBInspectable var leftTitle: String = "" {
            didSet {
                leftTitleLbl.text = leftTitle.localize()
            }
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
            let name = String(describing: type(of: self))
            let nib = UINib(nibName: name, bundle: nil)
            nib.instantiate(withOwner: self, options: nil)
            addSubview(containerView)
            containerView.frame = self.bounds
            containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        }
    }

