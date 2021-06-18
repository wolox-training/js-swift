//
//  InfoBookSectionView.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation
import UIKit

final class InfoBookSectionView: NibView {
    
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var availabilityBook: UILabel!
    @IBOutlet weak var authorBook: UILabel!
    @IBOutlet weak var genreBook: UILabel!
    @IBOutlet weak var yearBook: UILabel!
    @IBOutlet weak var addToWishListButton: UIButton! {
        didSet {
            addToWishListButton.layer.cornerRadius = 22
            addToWishListButton.layer.borderColor = UIColor(red: 0, green: 0.68, blue: 0.93, alpha: 1).cgColor
            addToWishListButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.gradientButton()
            rentButton.layer.cornerRadius = 22
            rentButton.setBackgroundImage(UIImage(named: "img_main button.png"), for: UIControl.State.normal)
        }
    }
    
    func configuration(with viewModel: InfoBookSectionViewModel) {
        titleBook.text = viewModel.title
        authorBook.text = viewModel.autor
        genreBook.text = viewModel.genre
        yearBook.text = viewModel.year
        availabilityText(status: viewModel.status)
        imageBook.load(from: viewModel.image)
        
    }
    
    func availabilityText(status: Status) {
        switch status {
        case .available:
            availabilityBook.text = NSLocalizedString("BOOK_AVAILABLE", comment: "Book available title")
            availabilityBook.textColor = .systemGreen
            rentButton.isEnabled = true
        case .unavailable:
            availabilityBook.text = NSLocalizedString("BOOK_UNAVAILABLE", comment: "Book unavailable title")
            availabilityBook.textColor = .systemRed
            rentButton.isEnabled = false
        }
    }
}

