//
//  Rent.swift
//  WBooks
//
//  Created by Juan Silva on 15/06/2021.
//

import Foundation

struct Rent: Codable {
    let bookId: Int
    let userId: Int
    let id: Int
    let from: String
    let to: String
    
    enum CodingKeys: String, CodingKey {
        case bookId = "book_id"
        case userId = "user_id"
        case id
        case from
        case to
    }
}
