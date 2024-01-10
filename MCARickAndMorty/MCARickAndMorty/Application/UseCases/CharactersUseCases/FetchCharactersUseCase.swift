//
//  CharacterUseCase.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

class FetchCharactersUseCase: UseCase {
    
    typealias Input = Int
    typealias Output = CharacterInfoResponse

    private let repository: CharacterRepository
    private let pageValidator: GreaterThanZeroValidator

    init(repository: CharacterRepository, validateWith pageValidator: GreaterThanZeroValidator) {
        self.repository = repository
        self.pageValidator = pageValidator
    }

    func execute(input: Int) async throws -> CharacterInfoResponse {
        try pageValidator.validate(input: input)
        return try await repository.fetchCharacters(page: input)
    }
}
