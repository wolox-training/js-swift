//
//  BookTests.swift
//  WBooksTests
//
//  Created by Juan Silva on 25/06/2021.
//

import XCTest
@testable import WBooks

class BookTests: XCTestCase {
    var sut: UnidentifiedBook!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = UnidentifiedBook(title: "Testing", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testIsValid() throws {
        let bookInvalid = UnidentifiedBook(title: "", author: "Juan Silva", genre: "Coding", year: "2021", image: "URLImageBook", status: Status.unavailable)
        XCTAssertTrue(sut.isValid(), "Book must be valid")
        XCTAssertFalse(bookInvalid.isValid(), "Book must not be valid")
    }

}
