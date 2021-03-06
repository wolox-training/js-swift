//
//  CellBookViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 11/06/2021.
//

import Foundation

final class CellBookViewModel {
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title
    }
    
    var autor: String {
        return book.author
    }
    
    var image: String {
        return book.image
    }
    
}
