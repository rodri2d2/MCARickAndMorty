//
//  EpisodeInfoResponse.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct EpisodeInfoResponse: Codable {
    let info: EpisodeBaseInfo
    let episodes: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case info
        case episodes = "results"
    }
}

struct EpisodeBaseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String
}

struct Episode: Identifiable, Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}

// For UI build purposes
extension Episode {
    static func empty() -> Self {
        Episode(
            id: 0,
            name: "",
            airDate: "",
            episode: "",
            characters: [],
            url: "",
            created: ""
        )
    }
    
    static func episode() -> Self {
        Episode(
            id: 1,
            name: "Pilot",
            airDate: "December 2, 2013",
            episode: "S01E01",
            characters: [
                "https://rickandmortyapi.com/api/character/1",
                "https://rickandmortyapi.com/api/character/2"
            ],
            url: "https://rickandmortyapi.com/api/episode/1",
            created: "2017-11-10T12:56:33.798Z"
        )
    }
    
    static func episodes() -> [Self] {
        [
            Self.episode(),
            Self.episode()
        ]
    }
}
