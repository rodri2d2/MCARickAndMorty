//
//  CharactersViewModel.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchCharactersUseCase: FetchCharactersUseCase
    
    init(fetchCharactersUseCase: FetchCharactersUseCase) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    func loadCharacters() async {
        do {
            let response = try await fetchCharactersUseCase.execute(input: 1)
            
            await MainActor.run {
                self.characters = response.characters
                self.isLoading = false
            }
            
        } catch {
            await MainActor.run {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}
