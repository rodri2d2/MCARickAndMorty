//
//  APISevice.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

protocol APIService {
    func execute<T: URLRequestBuilder>(for requestBuilder: T) async throws -> T.Response
}
