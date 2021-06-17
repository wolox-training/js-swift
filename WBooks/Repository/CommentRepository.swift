//
//  CommentRepository.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation
import Alamofire

protocol CommentRepositoryProtocol {
    func fetchComments(bookId: Int ,onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void)
}

public class CommentRepository: CommentRepositoryProtocol {
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let booksPath: String = "/books/"
    private static let commentsPath: String = "/comments"
    
    func fetchComments(bookId: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "\(CommentRepository.baseURL)\(CommentRepository.booksPath)\(bookId)\(CommentRepository.commentsPath)") else { return }
        AF
            .request(url, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONComments = try? JSONSerialization.data(withJSONObject: value, options: [])
                    else {
                        onError(CommentError.decodeError)
                        return
                    }
                    guard let comments = try? JSONDecoder().decode([Comment].self, from: JSONComments) else {
                        onError(CommentError.decodeError)
                        return
                    }
                    onSuccess(comments)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum CommentError: Error {
    case decodeError
}
