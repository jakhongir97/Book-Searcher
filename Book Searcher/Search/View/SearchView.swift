//
//  SearchView.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

final class SearchView: CustomView {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.searchTextField.backgroundColor = UIColor.appColor(.mySecondBackground)
            searchBar.updateHeight(height: 36)
            searchBar.tintColor = UIColor.appColor(.myBlack)
            searchBar.showsBookmarkButton = true
            searchBar.setImage(UIImage.appImage(.voice), for: .bookmark, state: .normal)
            searchBar.showsCancelButton = false
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: SearchTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.defaultReuseIdentifier)
        }
    }
}
