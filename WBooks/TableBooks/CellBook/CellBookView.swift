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
    
    func configureCell(with viewModel: CellBookViewModel) {
        titleBook.text = viewModel.title
        subtitleBook.text = viewModel.autor
        
        if let url = URL(string: viewModel.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageBook.image = UIImage(data: data)
                    }
                }
            }
        }
        // let url = URL(string: viewModel.image)
        // let data = try? Data(contentsOf: url)
        // imageBook.image = UIImage(data: data!)
    }
    
   
    
}
