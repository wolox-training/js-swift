//
//  CommentCellView.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation
import UIKit

final class CommentCellView: UITableViewCell {
    
    @IBOutlet weak var containerVire: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel!
    
    static var identifier: String {
        return String(describing: CommentCellView.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with viewModel: CommentCellViewModel) {
        userName.text = viewModel.userName
        userComment.text = viewModel.content
        userImage.image = UIImage(named: viewModel.userImage)
    }
}
