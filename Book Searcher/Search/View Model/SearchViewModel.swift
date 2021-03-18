//
//  SearchViewModel.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

protocol SearchViewModelProtocol: ViewModelProtocol {
    func didFinishFetch(data: String)
}

final class SearchViewModel {
    
    // MARK: - Attributes
    weak var delegate: SearchViewModelProtocol?
    
    // MARK: - Network call
    
}

