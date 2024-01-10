//
//  CharacterRepository.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

protocol CharacterRepository {
    func fetchCharacters(page: Int) async throws -> CharacterInfoResponse
    func fetchCharacterDetail(id: Int) async throws -> Character
}

class CharacterRepositoryImpl: CharacterRepository {
    
    private let dataManager: CharacterDataManager

    init(dataManager: CharacterDataManager) {
        self.dataManager = dataManager
    }

    func fetchCharacters(page: Int) async throws -> CharacterInfoResponse {
        let request = AllCharactersResquest(page: page)
        return try await dataManager.fetchCharacters(for: request)
    }

    func fetchCharacterDetail(id: Int) async throws -> Character {
        let request = SingleCharacterResquest(for: id)
        return try await dataManager.fetchSingleCharacter(for: request)
    }
}

