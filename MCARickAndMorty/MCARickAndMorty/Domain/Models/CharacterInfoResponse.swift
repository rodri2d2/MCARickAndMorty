//
//  CharacterInfo.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct CharacterInfoResponse: Codable {
    let info: CharacterBaseInfo
    let characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

/// Info model that contains very basic info about the whole API repose for all Characters (Refactor?)
struct CharacterBaseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
}

/// A Character model itself
struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharLocation
    let location: CharLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

/// A Character Location model itself
struct CharLocation: Codable {
    let name: String
    let url: String
}

// For UI build purposes
extension Character {
    
    static func empty() -> Self {
        Character(
            id: 0,
            name: "",
            status: "",
            species: "",
            type: "",
            gender: "",
            origin: CharLocation(name: "", url: ""),
            location: CharLocation(name: "", url: ""),
            image: "", episode: [],
            url: "",
            created: ""
        )
    }
    
    static func character() -> Self {
        Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: CharLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"),
            location: CharLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2"
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }

    static func characters() -> [Self] {
        [
            Self.character(),
            Self.character()
        ]
    }
}

