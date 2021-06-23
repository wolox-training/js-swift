//
//  NewBookViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 18/06/2021.
//

import Foundation

class NewBookViewModel {
    private let bookRepository: BookRepositoryProtocol
    
    init(bookRepositoty: BookRepositoryProtocol = BookRepository()) {
        self.bookRepository = bookRepositoty
    }
    
    func addBook(book: UnidentifiedBook,onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        if book.isValid() {
            let onAddSuccess = { (book: UnidentifiedBook) in
                onSuccess()
            }
            bookRepository.addBook(book: book, onSuccess: onAddSuccess, onError: onError)
        } else {
            onError(NewBookViewError.bookFail)
        }
    }
}

enum NewBookViewError: Error{
    case bookFail
}
