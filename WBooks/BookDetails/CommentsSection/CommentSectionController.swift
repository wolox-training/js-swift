//
//  CommentSectionController.swift
//  WBooks
//
//  Created by Juan Silva on 16/06/2021.
//

import Foundation
import UIKit

class CommentSectionController: UITableViewController {
    private lazy var commentSectionView = CommentSectionView()
    private let commentSectionViewModel: CommentSectionViewModel
    
    init(commentSectionViewModel: CommentSectionViewModel) {
        self.commentSectionViewModel = commentSectionViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = commentSectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationTable()
        loadComments()
    }
    
    func configurationTable() {
        commentSectionView.commentsTable.delegate = self
        commentSectionView.commentsTable.dataSource = self
        let nib = UINib(nibName: CommentCellView.identifier, bundle: nil)
        commentSectionView.commentsTable.register(nib, forCellReuseIdentifier: CommentCellView.identifier)
    }
    
    func loadComments(){
        commentSectionViewModel.fetchComments(onSuccess: { [weak self] in
            self?.reloadTable()
        }, onError: { [weak self] error in
            self?.showError(error: error)
        })
    }
    
    func reloadTable() {
        commentSectionView.commentsTable.reloadData()
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_ERROR_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = commentSectionViewModel.numberOfComments
        if count > 5 {
            count = 5
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCellView.identifier, for: indexPath) as! CommentCellView
        let commentCell = commentSectionViewModel.createCommentCellViewModel(at: indexPath)
        cell.configureCell(with: commentCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
