//
//  Suggestio.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation

struct Suggestion: Codable {
    let userId: Int
    let id: Int
    let link: String
    let title: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case id
        case link
        case title
        case author
    }
}
