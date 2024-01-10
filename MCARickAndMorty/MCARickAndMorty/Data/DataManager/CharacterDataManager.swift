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

    func fetchCharacters(page: Int) async throws -> CharacterInfoResponse {
        let requestBuilder = AllCharactersResquest()
        return try await networkService.execute(for: requestBuilder)
    }
    
    func fetchSingleCharacter(id: Int) async throws -> Character {
        let requestBuilder = SingleCharacterResquest(for: id)
        return try await networkService.execute(for: requestBuilder)
    }

}
