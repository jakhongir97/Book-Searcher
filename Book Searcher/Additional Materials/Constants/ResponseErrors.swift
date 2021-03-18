//
//  ResponseErrors.swift
//  Book Searcher
//
//  Created by Jakhongir Nematov on 18/03/21.
//

enum Result<T> {
    case Success(T)
    case Error(APIError, String? = nil)
}

enum APIError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case serverError
    case fromMessage
}
