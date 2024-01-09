//
//  CharacterPaths.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import Foundation

enum CharacterPaths: APIPath {
    case all
    case single(id: Int)
    
    var path: String {
        switch self {
        case .all: return "character"
        case .single(let id): return "character/\(id)"
        }
    }
}
