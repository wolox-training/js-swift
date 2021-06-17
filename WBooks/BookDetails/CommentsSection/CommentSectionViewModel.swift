//
//  CommentSectionViewModel.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation

class CommentSectionViewModel {
    private var comments: [Comment] = []
    private var repositoryComment: CommentRepositoryProtocol
    private let bookId: Int
    
    init(bookId: Int, repositotyComment: CommentRepositoryProtocol = CommentRepository()) {
        self.repositoryComment = repositotyComment
        self.bookId = bookId
    }
    
    var numberOfComments: Int {
        return comments.count
    }
    
    func createCommentCellViewModel(at indexPath: IndexPath) -> CommentCellViewModel {
        return CommentCellViewModel(comment: comments[indexPath.item])
    }
    
    func fetchComments(onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        let onFetchSuccess = { [weak self] (comments: [Comment]) in
            self?.comments = comments
            onSuccess()
        }
        repositoryComment.fetchComments(bookId: bookId, onSuccess: onFetchSuccess, onError: onError)
    }
}
