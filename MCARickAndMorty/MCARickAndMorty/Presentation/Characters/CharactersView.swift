//
//  CharactersView.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel

        var body: some View {
            List(viewModel.characters, id: \.id) { character in
                HStack {
                    AsyncImage(url: URL(string: character.image))
                        .frame(width: 50, height: 50)
                    Text(character.name)
                }

            }
            .task {
               await viewModel.loadCharacters()
            }
        }
}

//#Preview {
//    CharactersView(viewModel: Cha)
//}
