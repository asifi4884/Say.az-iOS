//
//  BankCardCell.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class BankCardCell: UITableViewCell {

    @IBOutlet weak var cardView: SimpleCardView!
    @IBOutlet weak var deleteBtn: CustomButton! {
        didSet {
            deleteBtn.isHidden = true
        }
    }
    var swipeAction: (() -> Void)!
    var deleteAction: (() -> Void)!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.contentView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.contentView.addGestureRecognizer(swipeLeft)


    }



    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                swipeAction()
                UIView.animate(withDuration: 0.2) {
                    self.deleteBtn.isHidden = false
                }
            case .left:

                UIView.animate(withDuration: 0.1) {
                    self.deleteBtn.isHidden = true
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
