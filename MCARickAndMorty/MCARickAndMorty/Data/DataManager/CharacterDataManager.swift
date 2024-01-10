//
//  CharacterDataManager.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

final class CharacterDataManager: DataManager {
    
    internal var networkService: APIService
    
    init(networkService: APIService) {
        self.networkService = networkService
    }

    func fetchCharacters(for request: AllCharactersResquest) async throws -> CharacterInfoResponse {
        return try await networkService.execute(for: request)
    }
    
    func fetchSingleCharacter(for request: SingleCharacterResquest) async throws -> Character {
        return try await networkService.execute(for: request)
    }

}
