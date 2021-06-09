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
    
    override func loadView() {
        view = tableBookView
    }
    
    private var books: [Book] = [Book(title: "A Little Bird Told Me", autor: "Timothy Cross", image: "img_book1.png"), Book(title: "When the Doves Disappeared", autor: "Sofi Oksanen", image: "img_book2.png"), Book(title: "The Best Book in the World", autor: "Peter Sjernstrom", image: "img_book3.png"), Book(title: "Be Creative", autor: "Tony Alcazar", image: "img_book4.png"), Book(title: "Redesign the Web", autor: "Liliana Castilla", image: "img_book5.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableBookView.booksTable.delegate = self
        tableBookView.booksTable.dataSource = self
        let nib = UINib(nibName: CellBookView.identifier, bundle: nil)
        tableBookView.booksTable.register(nib, forCellReuseIdentifier: CellBookView.identifier)


    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return books.count
        return 1
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CellBookView.identifier, for: indexPath) as! CellBookView

        cell.layer.cornerRadius = 16

        cell.titleBook.text = books[indexPath.section].title
        cell.subtitleBook.text = books[indexPath.section].autor
        let nameImage: String! = books[indexPath.section].image
        cell.imageBook.image = UIImage(named: nameImage)

        return cell
    }

}
