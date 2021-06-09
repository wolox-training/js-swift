//
//  CellBookView.swift
//  WBooks
//
//  Created by Juan Silva on 04/06/2021.
//

import Foundation
import UIKit
final class CellBookView: UITableViewCell {
    
    static var identifier: String {
        return String(describing: CellBookView.self)
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var subtitleBook: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        containerView.layer.cornerRadius = 16
    }
    
    func setup(with book: Book) {
        titleBook.text = book.title
        subtitleBook.text = book.autor
        imageBook.image = UIImage(named: book.image)
    }
    
}
