//
//  BookTests.swift
//  WBooksTests
//
//  Created by Juan Silva on 25/06/2021.
//

import XCTest
@testable import WBooks

class BookTests: XCTestCase {

    func testIsValid() {
        let bookValid = UnidentifiedBook(title: "Testing", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        let bookInvalid = UnidentifiedBook(title: "", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        
        XCTAssertTrue(bookValid.isValid(), "Book must be valid")
        XCTAssertFalse(bookInvalid.isValid(), "Book must not be valid")
    }

}
