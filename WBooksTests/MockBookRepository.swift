//
//  MockBookRepository.swift
//  WBooksTests
//
//  Created by Juan Silva on 28/06/2021.
//

import XCTest
@testable import WBooks

class MockBookRepository: BookRepositoryProtocol {
    let bookJSON = """
                    { "title": "Testing", "author": "Juan Silva", "genre": "Coding", "year": "2021", "image": "URLImageBook", "status": "Unavailable" }
                   """

    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        
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
