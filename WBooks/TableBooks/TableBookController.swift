//
//  TableBookController.swift
//  WBooks
//
//  Created by Juan Silva on 04/06/2021.
//

import Foundation
import UIKit

final class TableBookController: UITableViewController {
    private lazy var tableBookView = TableBookView()
    private let bookViewModel: TableBookViewModel
    
    init(bookViewModel: TableBookViewModel) {
        self.bookViewModel = bookViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = tableBookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationTable()
        configurationNavigationBar()
    }
    
    func configurationTable() {
        tableBookView.booksTable.delegate = self
        tableBookView.booksTable.dataSource = self
        let nib = UINib(nibName: CellBookView.identifier, bundle: nil)
        tableBookView.booksTable.register(nib, forCellReuseIdentifier: CellBookView.identifier)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.numberOfBooks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellBookView.identifier, for: indexPath) as! CellBookView
        let bookCell = bookViewModel.createBookCellViewModel(at: indexPath)
        cell.configureCell(whit: bookCell)
        return cell
    }
    
    func configurationNavigationBar() {
        // Set Title
        navigationItem.title = NSLocalizedString("LIBRARY_TITLE", comment: "Title for the navigation bar")
        // Set left and right buttons
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_notifications.png"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_search.png"), style: .plain, target: nil, action: nil)
    }
}
