//
//  Rent.swift
//  WBooks
//
//  Created by Juan Silva on 15/06/2021.
//

import Foundation

struct Rent: Codable {
    let book_id: Int
    let user_id: Int
    let id: Int
    let from: String
    let to: String
}
