//
//  CharacterPaths.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import Foundation

enum CharacterPaths: APIPath {
    case all(page: Int)
    case single(id: Int)
    
    var path: String {
        switch self {
        case .all(let page): return "character/?page=\(page)"
        case .single(let id): return "character/\(id)"
        }
    }
}
