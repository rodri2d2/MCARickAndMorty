//
//  EpisodePaths.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import Foundation

enum EpisodePaths: APIPath {
    case all
    case single(id: Int)
    
    var path: String {
        switch self {
        case .all: return "episode"
        case .single(let id): return "episode/\(id)"
        }
    }
}
