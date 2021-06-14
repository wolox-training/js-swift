//
//  TableBookViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 11/06/2021.
//

import Foundation

class TableBookViewModel {
//    private var books: [Book] = [Book(title: "A Little Bird Told Me", autor: "Timothy Cross", image: "img_book1.png"), Book(title: "When the Doves Disappeared", autor: "Sofi Oksanen", image: "img_book2.png"), Book(title: "The Best Book in the World", autor: "Peter Sjernstrom", image: "img_book3.png"), Book(title: "Be Creative", autor: "Tony Alcazar", image: "img_book4.png"), Book(title: "Redesign the Web", autor: "Liliana Castilla", image: "img_book5.png")]
    private var books: [Book] = []
    let repositoryBook: BookRepository
    
    
    init(repositoryBook: BookRepository = BookRepository()) {
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

