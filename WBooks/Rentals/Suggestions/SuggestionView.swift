//
//  SuggestionView.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation
import UIKit

final class SuggestionView: NibView {
    
    @IBOutlet weak var suggestionTitle: UILabel! {
        didSet {
            suggestionTitle.text = NSLocalizedString("SUGGESTION_LABEL_TITLE", comment: "Suggestion title")
        }
    }
    @IBOutlet weak var suggestionCollection: UICollectionView!
}
