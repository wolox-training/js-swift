//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation

class RentalsViewModel {
    private var rentals: [Rent] = []
    private var booksRents: [Book] = []
    private let rentRepository: RentRepositoryProtocol
    private let bookRepository: BookRepositoryProtocol
    
    init(rentRepository: RentRepositoryProtocol = RentRepository(), bookRepository: BookRepositoryProtocol = BookRepository()) {
        self.rentRepository = rentRepository
        self.bookRepository = bookRepository
    }
    
    var numberofRentals: Int {
        return booksRents.count
    }
    
    func  createRentalCellViewModel(at indexPath: IndexPath) -> CellBookViewModel {
        return CellBookViewModel(book: booksRents[indexPath.item])
    }
    
    func createSuggestionViewModel() -> SuggestionViewModel {
        return SuggestionViewModel()
    }
    
    func fetchRentals(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Rent]) in
            self?.rentals = books
            self?.fetchBookRentals(onSuccess: onSuccess, onError: onError)
        }
        rentRepository.fetchRentals(userId: 11, onSuccess: onFetchSuccess, onError: onError)
    }
    
    func fetchBookRentals(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (books: [Book]) in
            guard let self = self else { return }
            for rent in self.rentals {
                if let book = books.first(where: { book in book.id == rent.bookId }) {
                    self.booksRents.append(book)
                }
            }
            onSuccess()
        }
        bookRepository.fetchBooks(onSuccess: onFetchSuccess, onError: onError)
    }
}
