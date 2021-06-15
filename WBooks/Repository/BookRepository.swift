//
//  Repository.swift
//  WBooks
//
//  Created by Juan Silva on 11/06/2021.
//

import Foundation
import Alamofire

protocol BookRepositoryProtocol {
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)
}

public class BookRepository: BookRepositoryProtocol {
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let booksPath: String = "/books"
    
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "\(BookRepository.baseURL)\(BookRepository.booksPath)") else { return }
        AF
            .request(url, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONBooks = try? JSONSerialization.data(withJSONObject: value, options: [])
                    else {
                        onError(BookError.decodeError)
                        return
                    }
                    guard let books = try? JSONDecoder().decode([Book].self, from: JSONBooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    onSuccess(books)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum BookError: Error {
    case decodeError
}
