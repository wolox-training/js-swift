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
    let tableBookViewModel: TableBookViewModel
    
    init(bookViewModel: TableBookViewModel) {
        self.tableBookViewModel = bookViewModel
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
        loadBooks()
    }
    
    func configurationTable() {
        tableBookView.booksTable.delegate = self
        tableBookView.booksTable.dataSource = self
        let nib = UINib(nibName: CellBookView.identifier, bundle: nil)
        tableBookView.booksTable.register(nib, forCellReuseIdentifier: CellBookView.identifier)
    }
    
    func loadBooks() {
        tableBookViewModel.fetchBook(onSuccess: { [weak self] in self?.reloadTable() }, onError: { [weak self] eror in self?.showError(error: eror) })
    }
    
    func reloadTable() {
        tableBookView.booksTable.reloadData()
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_ERROR_MESSAGE", comment: "Message erro"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableBookViewModel.numberOfBooks
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellBookView.identifier, for: indexPath) as! CellBookView
        let bookCell = tableBookViewModel.createBookCellViewModel(at: indexPath)
        cell.configureCell(with: bookCell)
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
