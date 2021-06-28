//
//  NewBookViewModelTests.swift
//  WBooksTests
//
//  Created by Juan Silva on 25/06/2021.
//

import XCTest
@testable import WBooks

class NewBookViewModelTests: XCTestCase {
    var sut: NewBookViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = NewBookViewModel(bookRepositoty: MockBookRepository())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testAddBook() throws {
        let book = UnidentifiedBook(title: "Testing", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        
        let promise = expectation(description: "Book add")
        let onSuccess = { promise.fulfill() }
        let onError = { (error: Error) in XCTFail("Error \(error)") }
        
        sut.addBook(book: book, onSuccess: onSuccess, onError: onError)
        wait(for: [promise], timeout: 15)
    }

}
