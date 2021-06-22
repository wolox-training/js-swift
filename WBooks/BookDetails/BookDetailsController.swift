//
//  BookDetailsController.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import UIKit

final class BookDetailsController: UIViewController {
    private lazy var bookDetailsView = BookDetailsView()
    private let viewModel: BookDetailsViewModel
    private lazy var infoBookSectionController: InfoBookSectionController = {
        let infoBookSectionViewModel = viewModel.createInfoBookSectionViewModel()
        return InfoBookSectionController(bookSectionViewModel: infoBookSectionViewModel)
    }()
    
    private lazy var commentSectionController: CommentSectionController = {
        let commentSectionViewModel = viewModel.createCommentSectionViewModel()
        return CommentSectionController(commentSectionViewModel: commentSectionViewModel)
    }()

    
    init(viewModel: BookDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = bookDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        load(controller: infoBookSectionController, in: bookDetailsView.infoViewContainer)
        load(controller: commentSectionController, in: bookDetailsView.commentViewContainer)
    }
    
    func configurationNavigationBar() {
        // Set Title
        navigationItem.title = NSLocalizedString("BOOK_DETAIL_TITLE", comment: "Title for the navigation bar")
    }
}

extension UIViewController {
    
    func load(controller: UIViewController, in container: UIView) {
        addChild(controller)
        container.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: container.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
        controller.didMove(toParent: self)
    }
}
