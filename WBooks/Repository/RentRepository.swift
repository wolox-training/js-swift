//
//  RentRepository.swift
//  WBooks
//
//  Created by Juan Silva on 15/06/2021.
//

import Foundation
import Alamofire

protocol RentRepositoryProtocol {
    func rentBook(bookId: Int, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void)
    func fetchRentals(userId: Int, onSuccess: @escaping ([Rent]) -> Void, onError: @escaping (Error) -> Void)
}

public class RentRepository: RentRepositoryProtocol {
    private static let baseURL: String = "https://ios-training-backend.herokuapp.com/api/v1"
    private static let usersPath: String = "/users/"
    private static let rentPath: String = "/rents"
    
    
    func rentBook(bookId: Int, onSuccess: @escaping (Rent) -> Void, onError: @escaping (Error) -> Void) {
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let param = Parameters(
            book_id: bookId,
            user_id: 11,
            from: formatter.string(from: today),
            to: formatter.string(from: tomorrow)
        )
        
        guard let url = URL(string: "\(RentRepository.baseURL)\(RentRepository.rentPath)") else { return }
        AF
            .request(url,
                     method: .post,
                     parameters: param,
                     encoder: JSONParameterEncoder.default)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONRent = try? JSONSerialization.data(withJSONObject: value, options: [])
                    else {
                        onError(RentError.decodeError)
                        return
                    }
                    guard let rents = try? JSONDecoder().decode(Rent.self, from: JSONRent) else {
                        onError(RentError.decodeError)
                        return
                    }
                    onSuccess(rents)
                case .failure(let error):
                    onError(error)
                }
            })
    }
    
    func fetchRentals(userId: Int, onSuccess: @escaping ([Rent]) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: "\(RentRepository.baseURL)\(RentRepository.usersPath)\(userId)\(RentRepository.rentPath)") else { return }
        AF
            .request(url, method: .get)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    guard let JSONRentals = try? JSONSerialization.data(withJSONObject: value, options: [])
                    else {
                        onError(RentError.decodeError)
                        return
                    }
                    guard let rents = try? JSONDecoder().decode([Rent].self, from: JSONRentals) else {
                        onError(RentError.decodeError)
                        return
                    }
                    onSuccess(rents)
                case .failure(let error):
                    onError(error)
                }
            })
    }
}

enum RentError: Error {
    case decodeError
}

struct Parameters : Codable {
    let book_id: Int
    let user_id: Int
    let from: String
    let to: String
}
