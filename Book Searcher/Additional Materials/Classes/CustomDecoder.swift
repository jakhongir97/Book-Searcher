//
//  CustomDecoder.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import Foundation

final class CustomDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
