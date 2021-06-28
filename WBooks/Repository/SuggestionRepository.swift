//
//  SuggestionsRepository.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation
import Alamofire

protocol SuggestionRepositoryProtocol {
    func fetchSuggestion(userId: Int, onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void)
}

public class SuggestionRepository: SuggestionRepositoryProtocol {
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let usersPath: String = "/users/"
    private static let suggestionPath: String = "/suggestions"
    
    func fetchSuggestion(userId: Int, onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "\(SuggestionRepository.baseURL)\(SuggestionRepository.usersPath)\(userId)\(SuggestionRepository.suggestionPath)") else { return }
        AF
            .request(url, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONSuggestions = try? JSONSerialization.data(withJSONObject: value, options: [])
                    else {
                        onError(SuggestionError.decodeError)
                        return
                    }
                    guard let suggestions = try? JSONDecoder().decode([Suggestion].self, from: JSONSuggestions) else {
                        onError(SuggestionError.decodeError)
                        return
                    }
                    onSuccess(suggestions)
                case .failure(let error):
                    onError(error)
                }
            })
    }
    
}

enum SuggestionError: Error {
    case decodeError
}
