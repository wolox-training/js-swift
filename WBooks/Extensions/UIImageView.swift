//
//  UIImageView.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import UIKit

extension UIImageView {
    
    func load(from stringUrl: String) {
        if let url = URL(string: stringUrl) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
