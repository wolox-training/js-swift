//
//  ViewController.swift
//  WBooks
//
//  Created by Juan Silva on 03/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textUser: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Value from Info.plist
        let value = Bundle.main.infoDictionary?["example"] as! String
        print("My value: \(value)")
        // Do any additional setup after loading the view.
    }
    @IBAction func ingresar(_ sender: UIButton) {
        print("Ingresado \(textUser.text!) ")
    }
    

}

