//
//  TabBarController.swift .swift
//  WBooks
//
//  Created by Juan Silva on 10/06/2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Change bar color
        tabBar.barTintColor = .white

        // TableBooks controller
        let tableView = WBooksNavigationController(rootViewController: TableBookController(bookViewModel: TableBookViewModel()))
        tableView.tabBarItem = UITabBarItem()
        tableView.tabBarItem.title = NSLocalizedString("LIBRARY_TABBAR", comment: "Title of library button in tab bar")
        tableView.tabBarItem.image = UIImage(named: "ic_library.png")
        tableView.tabBarItem.tag = 0
        // WhisList controller
        let wishList = WBooksNavigationController(rootViewController: TableBookController(bookViewModel: TableBookViewModel()))
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = NSLocalizedString("WHISLIST_TABBAR", comment: "Title of whislist button in tab bar")
        wishList.tabBarItem.image = UIImage(named: "ic_wishlist.png")
        wishList.tabBarItem.tag = 1
        // Add New controller
        let addNew = WBooksNavigationController(rootViewController: NewBookController(newBookViewModel: NewBookViewModel()))
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = NSLocalizedString("ADDNEW_TABBAR", comment: "Title of add new button in tab bar")
        addNew.tabBarItem.image = UIImage(named: "ic_add new.png")
        addNew.tabBarItem.tag = 2
        // Rentals controller
        let rentals = WBooksNavigationController(rootViewController: RentalsController(rentViewModel: RentalsViewModel()))
        rentals.tabBarItem = UITabBarItem()
        rentals.tabBarItem.title = NSLocalizedString("RENTALS_TABBAR", comment: "Title of rentals button in tab bar")
        rentals.tabBarItem.image = UIImage(named: "ic_myrentals.png")
        rentals.tabBarItem.tag = 3
        // Settings controller
        let settings = WBooksNavigationController(rootViewController: TableBookController(bookViewModel: TableBookViewModel()))
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = NSLocalizedString("SETTINGS_TABBAR", comment: "Title of settings button in tab bar")
        settings.tabBarItem.image = UIImage(named: "ic_settings.png")
        settings.tabBarItem.tag = 4

        viewControllers = [tableView, wishList, addNew, rentals, settings]

    }

}
