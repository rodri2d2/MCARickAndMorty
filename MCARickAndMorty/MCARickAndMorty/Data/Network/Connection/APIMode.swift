//
//  APIMode.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import Foundation

struct APIConfig {
    static let devURL = "https://rickandmortyapi-dev.com/api/"
    static let prodURL = "https://rickandmortyapi.com/api/"
}


enum APIMode {
    case dev
    case prod

    var host: String {
        switch self {
        case .dev:
            return APIConfig.devURL
        case .prod:
            return APIConfig.prodURL
        }
    }
}
