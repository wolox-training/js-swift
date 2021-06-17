//
//  InfoBookSectionViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation

class InfoBookSectionViewModel {
    private let book: Book
    private let rentRepository: RentRepositoryProtocol
    
    init(book: Book, rentRepository: RentRepositoryProtocol = RentRepository()) {
        self.book = book
        self.rentRepository = rentRepository
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
    
    var status: Status{
        return book.status
    }
    
    func rentBook(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onRentSuccess = { [weak self] (rent: Rent) in
            onSuccess()
        }
        rentRepository.rentBook(bookId: book.id, onSuccess: onRentSuccess, onError: onError)
    }
}
