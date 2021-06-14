//
//  TableBookViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 11/06/2021.
//

import Foundation

class TableBookViewModel {
    private var books: [Book] = []
    private let repositoryBook: BookRepositoryProtocol
    
    
    init(repositoryBook: BookRepositoryProtocol = BookRepository()) {
        self.repositoryBook = repositoryBook
    }
    
    var numberOfBooks: Int {
        return books.count
    }
    
    func createBookCellViewModel(at indexPath: IndexPath) -> CellBookViewModel {
        return CellBookViewModel(book: books[indexPath.item])
    }
    
    func fetchBook(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Book]) in
            self?.books = books
            onSuccess()
        }
        repositoryBook.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}

