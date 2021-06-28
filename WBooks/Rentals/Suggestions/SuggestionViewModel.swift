//
//  SuggestionViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation

class SuggestionViewModel {
    private var suggestions: [Suggestion] = []
    private var repositorySuggestion: SuggestionRepositoryProtocol
    
    init(repositorySuggestion: SuggestionRepositoryProtocol = SuggestionRepository() ) {
        self.repositorySuggestion = repositorySuggestion
    }
    
    var numberOfSuggestions: Int {
        return suggestions.count
    }
    
    func createSuggestionsCellViewModel(index: Int) -> SuggestionCellViewModel {
        return SuggestionCellViewModel(suggestion: suggestions[index])
    }
    
    func fetchSuggestions(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (suggestions: [Suggestion]) in
            self?.suggestions = suggestions
            onSuccess()
        }
        repositorySuggestion.fetchSuggestion(userId: 11, onSuccess: onFetchSuccess, onError: onError)
    }
}

