//
//  CommentCellViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation

final class CommentCellViewModel {
    private let comment: Comment
    private var names = ["Juan Silva", "Pedro Paez", "Jorge Lopez", "Maria Diaz"]
    private var imageNames = ["img_user1.png", "img_user2.png"]
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var content: String {
        return comment.content
    }
    
    var userImage: String {
        return imageNames[Int.random(in: 0..<2)]
    }
    
    var userName: String {
        return names[Int.random(in: 0..<4)]
    }
}
