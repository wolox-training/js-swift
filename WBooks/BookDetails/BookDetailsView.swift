//
//  BookDetailView.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation
import UIKit

final class BookDetailsView: NibView {
    
    private static let cornerRadius: CGFloat = 7
    
    @IBOutlet weak var infoViewContainer: UIView! {
        didSet {
            infoViewContainer.layer.cornerRadius = BookDetailsView.cornerRadius
            infoViewContainer.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var commentViewContainer: UIView! {
        didSet {
            commentViewContainer.layer.cornerRadius = BookDetailsView.cornerRadius
            commentViewContainer.clipsToBounds = true
        }
    }
}
