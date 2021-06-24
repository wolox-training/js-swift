//
//  SuggestionCellView.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation
import UIKit

final class SuggestionCellView: UICollectionViewCell {
    
    @IBOutlet weak var imageBook: UIImageView!
    
    static var identifier: String {
        return String(describing: SuggestionCellView.self)
    }
    
    func configureCell (with viewModel: SuggestionCellViewModel) {
        imageBook.load(from: viewModel.image)
    }
}
