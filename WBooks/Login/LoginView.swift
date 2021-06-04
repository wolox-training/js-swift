//
//  LoginView.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 04/06/2021.
//

import Foundation
import UIKit

final class LoginView: NibView {
    
    @IBOutlet weak var myLabel: UILabel! {
        didSet {
            myLabel.text = "Hi hi!"
        }
    }
    
    
}
