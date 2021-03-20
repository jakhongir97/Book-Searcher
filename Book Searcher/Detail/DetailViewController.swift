//
//  DetailViewController.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

class DetailViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    // MARK: - Root View
    typealias RootView = DetailView
    
    // MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
    internal var isLoading: Bool = false
    

    // MARK: - Attributes
    override var prefersStatusBarHidden: Bool { return true }
    internal var book: Book?

    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        
        guard let book = book else { return }
        setupDetail(book: book)
    }
    
}


// MARK: - Other funcs
extension DetailViewController {
    private func appearanceSettings() {
        navigationItem.title = "Detail"
        navigationController?.navigationBar.opacityNavBar()
    }
    
    private func setupDetail(book: Book) {
        view().titleLabel.text = book.volumeInfo?.title
        view().authorsLabel.text = book.volumeInfo?.authors?.joined(separator: ", ")
        if let imageURL = book.volumeInfo?.imageLinks?.thumbnail {
            view().imageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage())
        }
    }
}

