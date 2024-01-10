//
//  DataManager.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

protocol DataManager {
    var networkService: APIService { get set }
}
