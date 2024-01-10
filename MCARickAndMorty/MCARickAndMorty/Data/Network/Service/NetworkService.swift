//
//  NetworkService.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

actor NetworkService: APIService {
    func execute<T>(for requestBuilder: T) async throws -> T.Response where T : URLRequestBuilder {
        
        let urlRequest = requestBuilder
            .buildRequest()
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
            throw APIError.unknownError
        }
        
        let decodedResponse = try JSONDecoder()
            .decode(T.Response.self, from: data)
        
        return decodedResponse
    }
}
