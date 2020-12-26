//
//  AddAccountCell.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/25/20.
//

import UIKit

class AddAccountCell: UITableViewCell {

    @IBOutlet weak var simpleCardView: SimpleCardView! {
        didSet {
            simpleCardView.addTapGestureRecognizer {
                self.addAccountAction()
            }
        }
    }
    var addAccountAction: (() -> Void)!
    override func awakeFromNib() {
        super.awakeFromNib()
        simpleCardView.containerView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
