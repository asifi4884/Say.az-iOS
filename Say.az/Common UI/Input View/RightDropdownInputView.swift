//
//  RightDropdownInputView.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 1/9/21.
//

import UIKit
import DropDown
class RightDropdownInputView: InputView {
    
    var list: [String] = ["AZN", "EUR", "USD", "RUB"]
    var selectedItem: ((Int, String) -> Void)?
    lazy var defualtSelectedItem = (0, list[0])
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        rightSelectionBtn.isHidden = false
        rightSelectionBtn.addTarget(self, action: #selector(rightBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc func rightBtnAction(_ sender: UIButton) {
        let dropDown = DropDown()
        
        dropDown.anchorView = self.containerView
        dropDown.dataSource = self.list
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            rightSelectionBtn.setTitle(item, for: .normal)
            self.selectedItem?(index, item)
        }
    }
}

