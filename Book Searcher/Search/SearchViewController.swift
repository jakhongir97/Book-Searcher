//
//  SearchViewController.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

class SearchViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    // MARK: - Root View
    typealias RootView = SearchView
    
    // MARK: - Services
    private let viewModel = SearchViewModel()
    internal var customSpinnerView = CustomSpinnerView()
    internal var isLoading: Bool = false
    
    // MARK: - Data Providers
    private var searchDataProvider: SearchDataProvider?

    // MARK: - Attributes
    override var prefersStatusBarHidden: Bool { return true }
    
    // MARK: - Actions
    
    @objc func search(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "", query.count >= 3, !isLoading else { return }
        isLoading = true
        viewModel.getBooks(query: query)
    }

    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        setupDataProvider()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("working")
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(search), object: searchBar)
        perform(#selector(search), with: searchBar, afterDelay: 0.3)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
}

// MARK: - Networking
extension SearchViewController: SearchViewModelProtocol {
    func didFinishFetch(books: [Book]) {
        isLoading = false
        searchDataProvider?.items = books
    }
    
}

// MARK: - Other funcs
extension SearchViewController {
    private func appearanceSettings() {
        navigationItem.title = "Search"
        navigationController?.navigationBar.opacityNavBar()
        viewModel.delegate = self
        view().searchBar.delegate = self
    }
    
    private func setupDataProvider() {
        let searchDataProvider = SearchDataProvider(viewController: self)
        searchDataProvider.tableView = view().tableView
        self.searchDataProvider = searchDataProvider
    }
}
