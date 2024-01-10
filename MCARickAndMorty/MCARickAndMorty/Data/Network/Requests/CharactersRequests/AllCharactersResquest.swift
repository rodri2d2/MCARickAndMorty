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
    var path: APIPath
    var method: HttpMethod = .GET
    
    init(page: Int = 1) {
        self.path = CharacterPaths.all(page: page)
    }
}
