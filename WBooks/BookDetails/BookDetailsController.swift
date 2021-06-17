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
        addSection(infoBookSectionController)
        addSection(commentSectionController)
    }

    private func addSection(_ child: UIViewController) {
        addChild(child)
        bookDetailsView.sections.addArrangedSubview(child.view)
        child.view.frame = bookDetailsView.sections.frame
        child.didMove(toParent: self)
    }
    
    func configurationNavigationBar() {
        // Set Title
        navigationItem.title = NSLocalizedString("BOOK_DETAIL_TITLE", comment: "Title for the navigation bar")
    }
}
