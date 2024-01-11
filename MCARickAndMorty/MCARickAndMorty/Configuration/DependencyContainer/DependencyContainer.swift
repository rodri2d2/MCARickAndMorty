//
//  MainDependencyContainer.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 11/1/24.
//

import Foundation

class DependencyContainer {
    
    private let charactersContainer = CharactersDependencyContainer()

    func resolve<T>() -> T {
        switch T.self {
        case is CharactersViewModel.Type:
            return charactersContainer.resolve()
        default:
            fatalError("No implementation found for \(T.self)")
        }
    }
}
