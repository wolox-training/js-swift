//
//  CellBookView.swift
//  WBooks
//
//  Created by Juan Silva on 04/06/2021.
//

import Foundation
import UIKit
final class CellBookView: UITableViewCell {
    
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var subtitleBook: UILabel!
    @IBOutlet weak var imageBook: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    static var identifier: String {
        return String(describing: CellBookView.self)
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 50, left: 50, bottom: 8, right: 50))
//    }
    
}
