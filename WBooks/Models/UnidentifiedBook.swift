//
//  UnidentifiedBook.swift
//  WBooks
//
//  Created by Juan Silva on 22/06/2021.
//

import Foundation

struct UnidentifiedBook: Codable {
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status: Status
    
    func isValid() -> Bool {
        if title.isEmpty { return false }
        if author.isEmpty { return false }
        if genre.isEmpty { return false }
        if year.isEmpty { return false }
        return true
    }
}
