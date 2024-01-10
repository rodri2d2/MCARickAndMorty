//
//  PageNumberValidator.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

class GreaterThanZeroValidator: Validator {
    func validate(input: Int) throws {
        guard input > 0 else { throw ValidationError.invalidPageNumber }
    }
}
