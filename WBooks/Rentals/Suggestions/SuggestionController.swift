//
//  SuggestionController.swift
//  WBooks
//
//  Created by Juan Silva on 23/06/2021.
//

import Foundation
import UIKit

final class SuggestionController: UICollectionViewController {
    private lazy var suggestionView = SuggestionView()
    private let suggestionViewModel: SuggestionViewModel

    init(suggestionViewModel: SuggestionViewModel) {
        self.suggestionViewModel = suggestionViewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = suggestionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationCollection()
        loadSuggestions()
    }
    
    func configurationCollection() {
        suggestionView.suggestionCollection.delegate = self
        suggestionView.suggestionCollection.dataSource = self
        let nib = UINib(nibName: SuggestionCellView.identifier, bundle: nil)
        suggestionView.suggestionCollection.register(nib, forCellWithReuseIdentifier: SuggestionCellView.identifier)
    }
    
    func loadSuggestions() {
        suggestionViewModel.fetchSuggestions(onSuccess: { [weak self] in
            self?.reloadCollection()
        }, onError: { [weak self] error in
            self?.showError(error: error)
        })
    }
    
    func reloadCollection() {
        suggestionView.suggestionCollection.reloadData()
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("ALERT_ERROR_TITLE", comment: "Title error"),
                                      message: NSLocalizedString("ALERT_ERROR_MESSAGE", comment: "Message error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ALERT_ERROR_CLOSE", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestionViewModel.numberOfSuggestions
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCellView.identifier, for: indexPath) as! SuggestionCellView
        let suggestionCell = suggestionViewModel.createSuggestionsCellViewModel(index: indexPath.row)
        cell.configureCell(with: suggestionCell)
        return cell
    }
}
