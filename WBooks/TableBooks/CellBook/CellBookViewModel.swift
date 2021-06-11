//
//  CellBookViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 11/06/2021.
//

import Foundation

final class CellBookViewModel {
    private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var title: String {
        return book.title
    }
    
    var autor: String {
        return book.autor
    }
    
    var image: String {
        return book.image
    }
    
}
