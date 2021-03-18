//
//  SearchDataProvider.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit
import SDWebImage

final class SearchDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    internal var items = [Book]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    // MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.defaultReuseIdentifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = items[indexPath.row].volumeInfo?.title
        cell.authorsLabel.text  = items[indexPath.row].volumeInfo?.authors?.first
        if let imageURL = items[indexPath.row].volumeInfo?.imageLinks?.thumbnail {
            cell.bookImageVIew.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage())
        }
        return cell
    }
    
    // MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = viewController as? SearchViewController else { return }
        vc.coordinator?.pushToDetailVC(book: items[indexPath.row])
    }
    
}
