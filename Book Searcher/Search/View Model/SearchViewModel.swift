//
//  SearchViewModel.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

protocol SearchViewModelProtocol: ViewModelProtocol {
    func didFinishFetch(books: [Book])
}

final class SearchViewModel {
    
    // MARK: - Attributes
    weak var delegate: SearchViewModelProtocol?
    
    // MARK: - Network call
    internal func getBooks(query: String) {
        delegate?.showActivityIndicator()
        JSONDownloader.shared.jsonTask(url: EndPoints.getVolumes.rawValue + query, requestMethod: .get, completionHandler: { [weak self]  (result) in
            guard let self = self else { return }
            switch result {
            case .Error(let error):
                self.delegate?.showAlertClosure(error: error)
            case .Success(let json):
                do {
                    let data = try CustomDecoder().decode(BookListModel.self, from: json)
                    if let items = data.items {
                        self.delegate?.didFinishFetch(books: items)
                    }
                } catch {
                    self.delegate?.showAlertClosure(error: (APIError.invalidData, nil))
                }
            }
            self.delegate?.hideActivityIndicator()
        })
    }
    
}

