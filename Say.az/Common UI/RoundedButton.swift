//
//  RoundedButton.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class RoundedButton: UIButton {
    var shadowLayer: CAShapeLayer!

    @IBInspectable var cornerRadius: CGFloat = 14
    @IBInspectable var isImgTinted: Bool = false
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        if isImgTinted {
            let img = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
            self.setImage(img, for: .normal)
        }

        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = self.backgroundColor?.cgColor

            shadowLayer.shadowColor = UIColor.darkGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 2.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 8
            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
}
