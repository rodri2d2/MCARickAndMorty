//
//  MCARickAndMortyApp.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 8/1/24.
//

import SwiftUI

@main
struct MCARickAndMortyApp: App {
    
    private let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            let viewModel: CharactersViewModel = container.resolve()
            CharactersView(viewModel: viewModel)
        }
    }
}
