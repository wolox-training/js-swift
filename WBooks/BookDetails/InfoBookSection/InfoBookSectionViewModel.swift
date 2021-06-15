//
//  InfoBookSectionViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation

class InfoBookSectionViewModel {
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
    
    var year: String {
        return book.year
    }
    
    var genre: String {
        return book.genre
    }
}
