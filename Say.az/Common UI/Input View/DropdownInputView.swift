//
//  FloatingInputView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//
import UIKit
import DropDown
class DropdownInputView: InputView {

    var list: [String] = ["FS", "sdsd", "sfdds", "fadadsfasd"]
    var selectedItem: ((Int, String) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {
        txtField.isEnabled = false
        containerView.addTapGestureRecognizer {
            let dropDown = DropDown()

            dropDown.anchorView = self.containerView
            dropDown.dataSource = self.list
            dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.show()

            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                if text.isEmpty {
                    self.txtField.placeholder = nil
                    self.animateTitleUp()
                }
                self.txtField.text = item
                self.selectedItem?(index, item)
            }
        }
    }
}

