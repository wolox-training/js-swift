//
//  UIButton.swift
//  WBooks
//
//  Created by Juan Silva on 18/06/2021.
//

import Foundation
import UIKit

extension UIButton {
    func gradientButton() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor,
            UIColor(red: 0.22, green: 0.8, blue: 0.8, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        clipsToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
