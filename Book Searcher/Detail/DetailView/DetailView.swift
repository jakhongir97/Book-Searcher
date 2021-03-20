//
//  DetailView.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

final class DetailView: CustomView {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 20
            imageView.layer.cornerCurve = .continuous
        }
    }
    @IBOutlet weak var authorsLabel: UILabel!
    
}
