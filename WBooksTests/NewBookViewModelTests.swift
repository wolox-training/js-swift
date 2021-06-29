//
//  NewBookViewModelTests.swift
//  WBooksTests
//
//  Created by Juan Silva on 25/06/2021.
//

import XCTest
@testable import WBooks

class NewBookViewModelTests: XCTestCase {
    
    func testAddBook() {
        let bookJSON = """
                        { "title": "Testing", "author": "Juan Silva", "genre": "Coding", "year": "2021", "image": "URLImageBook", "status": "Unavailable" }
                       """

        let bookRepository = MockBookRepository(bookJson: bookJSON)
        let newBookViewModel = NewBookViewModel(bookRepositoty: bookRepository)
        let book = UnidentifiedBook(title: "Testing", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        
        let bookExpectation = expectation(description: "Book add")
        let onSuccess = { bookExpectation.fulfill() }
        let onError = { (error: Error) in XCTFail("Error \(error)") }
        
        newBookViewModel.addBook(book: book, onSuccess: onSuccess, onError: onError)
        wait(for: [bookExpectation], timeout: 15)
    }

}
