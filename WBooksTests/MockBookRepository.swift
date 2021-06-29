//
//  MockBookRepository.swift
//  WBooksTests
//
//  Created by Juan Silva on 28/06/2021.
//

import XCTest
@testable import WBooks

class MockBookRepository: BookRepositoryProtocol {
    private let bookJSON: String

    init(bookJson: String) {
        self.bookJSON = bookJson
    }
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        // no-op
    }
    
    func addBook(book: UnidentifiedBook, onSuccess: @escaping (UnidentifiedBook) -> Void, onError: @escaping (Error) -> Void) {
        do {
            let book = try JSONDecoder().decode(UnidentifiedBook.self, from: bookJSON.data(using: .utf8)!)
            onSuccess(book)
        } catch {
            onError(BookError.decodeError)
        }
    }
}
