//
//  Coordinator.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

