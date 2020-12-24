//
//  RoundedButton.swift
//  Say.az
//
//  Created by Ulxan Emiraslanov on 12/16/20.
//

import UIKit

class RoundedButton: UIButton {
    var shadowLayer: CAShapeLayer!
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 14

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
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
