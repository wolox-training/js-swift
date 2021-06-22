//
//  InputFields.swift
//  WBooks
//
//  Created by Juan Silva on 18/06/2021.
//

import UIKit

@IBDesignable
open class CustomInputFields: UITextField {
    private var valid: ((String) -> Bool)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        self.borderStyle = .none
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1.0
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowRadius = 0
    }
    
}
