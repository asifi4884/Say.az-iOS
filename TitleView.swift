//
//  TitleView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/26/20.
//

import UIKit

    class TitleView: UIView {

        @IBOutlet var filterView: [UIView]!
        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var filterBtn: UIButton!
        @IBOutlet weak var containerView: UIView!

        @IBInspectable var hasFilter: Bool = false {
            didSet {
                filterView.forEach { $0.isHidden = !hasFilter }
            }
        }
        @IBInspectable var title: String = "" {
            didSet {
                titleLbl.text = title.localize()
            }
        }


        var list = [String]()
        var filterAction: ((Int) -> Void)!

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

        @IBAction func filterBtnTapped() {
            var actions: [(title: String, style: UIAlertAction.Style)] = []
            list.forEach { (title) in
                actions.append((title: title, style: .default))
            }
            actions.append((title: "cancel.button.title".localize(), style: .cancel))

            self.parentViewController?.showAlert(with: "", preferredStyle: .actionSheet, actions: actions, completion: { (index, action) in
                if action.style != .cancel {
                    self.filterAction(index)
                }
            })
        }
    }

