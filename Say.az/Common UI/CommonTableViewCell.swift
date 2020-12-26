//
//  CommonTableViewCell.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/26/20.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    @IBOutlet var leftActionBtns: [UIButton]! {
        didSet {
            leftActionBtns.forEach { $0.isHidden = true }
        }
    }

    var hasLeftActions = false {
        didSet {
            guard hasLeftActions else { return }

            self.contentView.isUserInteractionEnabled = true
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.contentView.addGestureRecognizer(swipeRight)

            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeLeft.direction = .left
            self.contentView.addGestureRecognizer(swipeLeft)
        }
    }

    var swipeAction: (() -> Void)!
    var deleteAction: (() -> Void)!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }



    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                if let swipeAction = swipeAction {
                    swipeAction()
                }

                UIView.animate(withDuration: 0.2) { [self] in
                    leftActionBtns.forEach { $0.isHidden = false }
                }
            case .left:

                UIView.animate(withDuration: 0.1) { [self] in
                    leftActionBtns.forEach { $0.isHidden = true }
                }
            default:
                break
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteBtnTapped() {
        deleteAction()
    }
    
}
