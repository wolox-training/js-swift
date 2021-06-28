//
//  SuggestionCellViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation

final class SuggestionCellViewModel {
    private let suggestion: Suggestion
    
    init(suggestion: Suggestion) {
        self.suggestion = suggestion
    }
    
    var image: String {
        return suggestion.link
    }
}
