//
//  UseCase.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype Output
    func execute(input: Input) async throws -> Output
}
