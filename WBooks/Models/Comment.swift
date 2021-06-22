//
//  Comment.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation

struct Comment: Codable {
    let id: Int
    let userId: Int
    let bookId: Int
    let content: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case bookId = "book_id"
        case userId = "user_id"
        case id
        case content
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
