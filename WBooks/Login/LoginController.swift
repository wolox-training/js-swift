//
//  LoginController.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 04/06/2021.
//

import Foundation
import UIKit

final class LoginController: UIViewController {
    
    private lazy var loginView: UIView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
