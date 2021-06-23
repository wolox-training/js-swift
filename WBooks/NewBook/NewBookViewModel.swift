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
            let onAddSuccess = { [weak self] (book: UnidentifiedBook) in
                onSuccess()
            }
            bookRepository.addBook(book: book, onSuccess: onAddSuccess, onError: onError)
        } else {
            onError(NewBookViewError.bookFail)
        }
    }
    
    func setValidate(inputField: CustomInputFields) {
        let validate = { (value: String) in return !value.isEmpty }
        inputField.setValidate(validate)
    }
}

enum NewBookViewError: Error{
    case bookFail
}
