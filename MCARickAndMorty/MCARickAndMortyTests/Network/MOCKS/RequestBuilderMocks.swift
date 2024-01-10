//
//  RequestBuilderMocks.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import Foundation
@testable import MCARickAndMorty

struct MockCharacter: Codable {
    var name: String
}

struct MockAPIPath: APIPath {
    var path: String = "testPath"
}

struct MockURLRequestBuilder: URLRequestBuilder {    
    typealias Response = MockCharacter
    var apiMode: APIMode = .dev
    var method: HttpMethod = .GET
    var path: APIPath = MockAPIPath()
    var parameters: [String : String] = ["key": "value"]
    var body: [String : Any] = ["bodyKey": "bodyValue"]
    var headers: [String : String] = ["Content-Type": "application/json", "Accept": "application/json", "Custom-Header": "CustomValue"]
}
