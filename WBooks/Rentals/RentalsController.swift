//
//  RentalsController.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation
import UIKit

final class RentalsController: UITableViewController {
    private lazy var rentalsView = RentalsView()
    private let rentalsViewModel: RentalsViewModel
    
    init(rentViewModel: RentalsViewModel) {
        self.rentalsViewModel = rentViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = rentalsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationTable()
        configurationNavigationBar()
        loadRentals()
    }

    func configurationTable() {
        rentalsView.rentalsTable.delegate = self
        rentalsView.rentalsTable.dataSource = self
        let nib = UINib(nibName: CellBookView.identifier, bundle: nil)
        rentalsView.rentalsTable.register(nib, forCellReuseIdentifier: CellBookView.identifier)
    }

    func loadRentals() {
        rentalsViewModel.fetchRentals(onSuccess: { [weak self] in
            self?.reloadTable()
        }, onError: { [weak self] error in
            self?.showError(error: error)
        })
    }

    private func reloadTable() {
        rentalsView.rentalsTable.reloadData()
    }

    func showError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_ERROR_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rentalsViewModel.numberofRentals
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellBookView.identifier, for: indexPath) as! CellBookView
        let rentCell = rentalsViewModel.createRentalCellViewModel(at: indexPath)
        cell.configureCell(with: rentCell)
        return cell
    }
    
    func configurationNavigationBar() {
        // Set Title
        navigationItem.title = NSLocalizedString("RENTALS_TITLE", comment: "Title for the navigation bar")
        // Set left and right buttons
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_notifications.png"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_search.png"), style: .plain, target: nil, action: nil)
    }
}

