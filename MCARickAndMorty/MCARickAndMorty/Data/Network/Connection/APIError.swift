//
//  APIError.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

enum APIError: Error {
    case urlError
    case parsingError
    case networkError
    case serverError(statusCode: Int)
    case unknownError
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .urlError:
            return "Invalid URL or issues building the URL"
        case .parsingError:
            return "Error when analysing the received data"
        case .networkError:
            return "Network connection failed"
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .unknownError:
            return "Unknown error"
        }
    }
}
