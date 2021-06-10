//
//  LoginController.swift
//  WBooks
//
//  Created by Juan Silva on 04/06/2021.
//

import Foundation
import UIKit

final class LoginController: UIViewController {

    private lazy var loginView = LoginView()

    override func loadView() {
        view = loginView
        loginView.textUser.placeholder = NSLocalizedString("USER_FIELD", comment: "Placeholder user text field")
        loginView.textPassword.placeholder = NSLocalizedString("PASSWORD_FIELD", comment: "Placeholder password text field")
        loginView.mainButton.setTitle(NSLocalizedString("LOGIN_BUTTON", comment: "Log In text button"), for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.mainButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        let controller = TabBarController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}

