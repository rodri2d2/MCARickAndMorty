//
//  AllCharactersResquest.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct AllCharactersResquest: URLRequestBuilder {
    typealias Response = CharacterInfoResponse
    var apiMode: APIMode = .prod
    var path: APIPath = CharacterPaths.all
    var method: HttpMethod = .GET
    var parameters: [String : String]
    
    init(page: Int = 1) {
        self.parameters = ["page": "\(page)"]
    }
}
