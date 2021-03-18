//
//  CustomView.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

class CustomView: UIView {

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundColor()
    }
    
    // MARK: - UI Setup
    private func setupBackgroundColor() {
        backgroundColor = UIColor.appColor(.myMainBackground)
    }
    
}
