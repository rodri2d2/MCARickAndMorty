//
//  MockNetworkService.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation
@testable import MCARickAndMorty

class MockNetworkService: APIService {
    
    enum MockData {
        case allCharacters
        case singleCharacter
    }
    
    let dataTypeToMock: MockData
    let jsonData: Data
    
    init(dataTypeToMock: MockData) {
        self.dataTypeToMock = dataTypeToMock
        
        switch dataTypeToMock {
        case .allCharacters:
            self.jsonData = CharacterInfoResponseMock.makeChactersResponseMock()
        case .singleCharacter:
            self.jsonData = SingleCharacterResponseMock.makeSingleCharacterResponseMock()
        }
    }
    
    func execute<T>(for requestBuilder: T) async throws -> T.Response where T : MCARickAndMorty.URLRequestBuilder {
        do {
            let decodedData = try JSONDecoder().decode(T.Response.self, from: self.jsonData)
            return decodedData
        } catch  {
            
            if error as? DecodingError != nil {
                throw APIError.parsingError
            }
            
            throw APIError.unknownError
        }
    }
}
