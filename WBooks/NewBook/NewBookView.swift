//
//  NewBookView.swift
//  WBooks
//
//  Created by Juan Silva on 18/06/2021.
//

import Foundation
import UIKit

final class NewBookView: NibView {
    
    @IBOutlet weak var bookNameInput: CustomInputFields! {
        didSet {
            bookNameInput.placeholder = NSLocalizedString("NAME_BOOK_FIELD", comment: "Placeholder name book")
        }
    }
    @IBOutlet weak var bookAuthorInput: CustomInputFields! {
        didSet {
            bookAuthorInput.placeholder = NSLocalizedString("AUTHOR_BOOK_FIELD", comment: "Placeholder author book")
        }
    }
    @IBOutlet weak var bookYearInput: CustomInputFields! {
        didSet {
            bookYearInput.placeholder = NSLocalizedString("YEAR_BOOK_FIELD", comment: "Placeholder year book")
        }
    }
    @IBOutlet weak var bookTopicInput: CustomInputFields! {
        didSet {
            bookTopicInput.placeholder = NSLocalizedString("TOPIC_BOOK_FIELD", comment: "Placeholder topic book")
        }
    }
    @IBOutlet weak var bookDescriptionInput: CustomInputFields! {
        didSet {
            bookDescriptionInput.placeholder = NSLocalizedString("DESCRIPTION_BOOK_FIELD", comment: "Placeholder description book")
        }
    }
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.gradientButton()
            submitButton.layer.cornerRadius = 22
            submitButton.setBackgroundImage(UIImage(named: "img_main button.png"), for: UIControl.State.normal)
        }
    }
    
    @IBOutlet weak var imageBookButton: UIButton! {
        didSet {
            imageBookButton.setBackgroundImage(UIImage(named: "ic_add photo"), for: .normal)
        }
    }
    
}
