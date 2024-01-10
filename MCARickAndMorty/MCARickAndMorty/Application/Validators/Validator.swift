//
//  Validator.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

protocol Validator {
    associatedtype Input
    func validate(input: Input) throws
}
