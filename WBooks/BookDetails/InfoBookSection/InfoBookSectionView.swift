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
    @IBOutlet weak var addToWishListButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    
    func configuration(with viewModel: InfoBookSectionViewModel) {
        titleBook.text = viewModel.title
        authorBook.text = viewModel.autor
        genreBook.text = viewModel.genre
        yearBook.text = viewModel.year
        imageBook.load(from: viewModel.image)
    }
}
