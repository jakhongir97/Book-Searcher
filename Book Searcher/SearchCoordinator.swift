//
//  SearchCoordinator.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = SearchViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    internal func pushToDetailVC(book: Book) {
        let vc = DetailViewController()
        vc.book = book
        navigationController.pushViewController(vc, animated: true)
    }
    
}
