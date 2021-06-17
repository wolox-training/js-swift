//
//  Comment.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation

struct Comment: Codable {
    let id: Int
    let user_id: Int
    let book_id: Int
    let content: String
    let created_at: String
    let updated_at: String
}
