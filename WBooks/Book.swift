//
//  Book.swift
//  WBooks
//
//  Created by Juan Silva on 09/06/2021.
//

import Foundation

struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status: Status
}

enum Status: String, Codable {
    case available = "Available"
    case unavailable = "Unavailable"
}
