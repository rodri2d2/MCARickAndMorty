//
//  ValidationErrors.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

enum ValidationError: Error, LocalizedError {
    
    case invalidNumber

    var errorDescription: String? {
        switch self {
        case .invalidNumber:
            return "Input must be greater then zero!"
        }
    }
}
