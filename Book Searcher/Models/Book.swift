//
//  Book.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

import Foundation

struct BookListModel: Decodable {
    let kind: String?
    let totalItems: Int?
    let items: [Book]?
}

struct Book: Decodable {
    let id: String
    let volumeInfo: VolumeInfo?
}

struct VolumeInfo: Decodable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let imageLinks: ImageLink?
}

struct ImageLink: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
}
