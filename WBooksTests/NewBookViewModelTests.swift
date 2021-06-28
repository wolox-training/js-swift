//
//  NewBookViewModelTests.swift
//  WBooksTests
//
//  Created by Juan Silva on 25/06/2021.
//

import XCTest
@testable import WBooks

class NewBookViewModelTests: XCTestCase {
    
    func testAddBook() throws {
        let bookJSON = """
                        { "title": "Testing", "author": "Juan Silva", "genre": "Coding", "year": "2021", "image": "URLImageBook", "status": "Unavailable" }
                       """
        
        let newBookViewModel = NewBookViewModel(bookRepositoty: MockBookRepository(bookJson: bookJSON))
        let book = UnidentifiedBook(title: "Testing", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        
        let promise = expectation(description: "Book add")
        let onSuccess = { promise.fulfill() }
        let onError = { (error: Error) in XCTFail("Error \(error)") }
        
        newBookViewModel.addBook(book: book, onSuccess: onSuccess, onError: onError)
        wait(for: [promise], timeout: 15)
    }

}
