//
//  LoginView.swift
//  WBooks
//
//  Created by Juan Silva on 04/06/2021.
//

import Foundation
import UIKit



final class LoginView: NibView {
    
    @IBOutlet weak var textUser: UITextField!
    @IBOutlet weak var textPassword: UITextField!
        
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Ingresado \(textUser.text!) ")
        
        
    }
    
}
