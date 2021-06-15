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
    }
    
}
