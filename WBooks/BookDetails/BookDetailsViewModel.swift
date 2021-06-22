//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation

class BookDetailsViewModel {
    private let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func createInfoBookSectionViewModel() -> InfoBookSectionViewModel {
        return InfoBookSectionViewModel(book: book)
    }
    
    func createCommentSectionViewModel() -> CommentSectionViewModel {
        return CommentSectionViewModel(bookId: book.id)
    }
}
