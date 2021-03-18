//
//  JSONData.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import Foundation

struct JSONData<T: Decodable>: Decodable {
    let code: Int
    let message: String
    
    let data: T
}
