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

    // MARK: - Attributes
    override var prefersStatusBarHidden: Bool { return true }

    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

// MARK: - Networking
extension SearchViewController: SearchViewModelProtocol {
    func didFinishFetch(data: String) {
        
    }
}

// MARK: - Other funcs
extension SearchViewController {
    private func appearanceSettings() {
        navigationItem.title = "Search"
        navigationController?.navigationBar.opacityNavBar()
        viewModel.delegate = self
    }
}
