//
//  NavBarController.swift
//  WBooks
//
//  Created by Juan Silva on 10/06/2021.
//

import Foundation
import UIKit
class NavBarController: UINavigationBar {
    
    func configNavigationBar(){
        UINavigationBar.appearance().barTintColor = UIColor(red: 0/255.0, green: 173/255.0, blue: 238/255.0, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
    }
}
