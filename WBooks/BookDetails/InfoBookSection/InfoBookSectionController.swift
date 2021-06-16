//
//  InfoBookSectionController.swift
//  WBooks
//
//  Created by Juan Silva on 14/06/2021.
//

import Foundation
import UIKit

class InfoBookSectionController: UIViewController {
    private lazy var infoBookSectionView = InfoBookSectionView()
    private let infoBookSectionViewModel: InfoBookSectionViewModel
        
    init(bookSectionViewModel: InfoBookSectionViewModel) {
        self.infoBookSectionViewModel = bookSectionViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = infoBookSectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoBookSectionView.configuration(with: infoBookSectionViewModel)
        infoBookSectionView.rentButton.addTarget(self, action: #selector(buttonRentPressed), for: .touchUpInside)
        infoBookSectionView.addToWishListButton.setTitle(NSLocalizedString("ADD_TO_WISHLIST_BUTTON", comment: "Add to wishlist text button"), for: .normal)
        infoBookSectionView.rentButton.setTitle(NSLocalizedString("RENT_BUTTON", comment: "Rent text button"), for: .normal)
    }
    
    @objc private func buttonRentPressed() {
        if infoBookSectionViewModel.status == .available {
            requestBook()
        } else {
            showAlertRent()
        }
    }
    
    func showAlertRent() {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_UNAVAILABLE_BOOK_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onRentError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_RENT_ERORR_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onRentSuccess() {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_RENT_SUCCESS_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_RENT_SUCCESS_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func requestBook() {
        infoBookSectionViewModel.rentBook( onSuccess: { [weak self] in
                self?.onRentSuccess()
            }, onError: { [weak self] error in
                self?.onRentError(error: error)
        })
    }
}
