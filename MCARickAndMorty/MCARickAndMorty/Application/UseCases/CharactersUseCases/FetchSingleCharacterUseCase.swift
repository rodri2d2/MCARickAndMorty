//
//  FetchSingleCharacterUseCase.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

class FetchCharacterDetailUseCase: UseCase {
    typealias Input = Int
    typealias Output = Character

    private let repository: CharacterRepository
    private let idValidator: GreaterThanZeroValidator

    init(repository: CharacterRepository, validateWith idValidator: GreaterThanZeroValidator) {
        self.repository = repository
        self.idValidator = idValidator
    }

    func execute(input: Input) async throws -> Output {
        try idValidator.validate(input: input)
        return try await repository.fetchCharacterDetail(id: input)
    }
}
