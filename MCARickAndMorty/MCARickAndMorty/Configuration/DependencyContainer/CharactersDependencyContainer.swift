//
//  CharactersDependencyContainer.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 11/1/24.
//

import Foundation

class CharactersDependencyContainer: DependencyContainerProtocol {
    
    
    var registeredDependencies: [String : () -> Any] = [:]
    
    init() {
        register(APIService.self) { NetworkService() as APIService }
        register(CharacterDataManager.self) { CharacterDataManager(networkService: self.resolve()) }
        register(CharacterRepository.self) { CharacterRepositoryImpl(dataManager: self.resolve()) }
        register(GreaterThanZeroValidator.self) { GreaterThanZeroValidator() }
        register(FetchCharactersUseCase.self) {
            FetchCharactersUseCase(repository: self.resolve(), validateWith: self.resolve())
        }
        register(CharactersViewModel.self) {
            CharactersViewModel(fetchCharactersUseCase: self.resolve())
        }
    }
    
    func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let factory = registeredDependencies[key]?() as? T else {
            fatalError("No hay una dependencia registrada para \(T.self)")
        }
        return factory
    }
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: T.self)
        registeredDependencies[key] = factory
    }
    
}
