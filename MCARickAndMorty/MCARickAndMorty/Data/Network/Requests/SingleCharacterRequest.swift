//
//  SingleCharacterRequest.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct SingleCharacterResquest: URLRequestBuilder {
    typealias Response = Character
    var apiMode: APIMode = .prod
    var path: APIPath
    var method: HttpMethod = .GET
    
    init(for id: Int) {
        self.path = CharacterPaths.single(id: id)
    }

}
