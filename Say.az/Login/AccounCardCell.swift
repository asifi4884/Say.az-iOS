//
//  AccounCardCell.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/20/20.
//

import UIKit

class AccounCardCell: UITableViewCell {

    @IBOutlet weak var icon: UIView! {
        didSet {
            icon.isHidden = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func select() {
        UIView.animate(withDuration: 0.2) {
            self.icon.isHidden = false
        }

    }

    func deSelect() {
        icon.isHidden = true
    }
}
