//
//  APIErrorTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import XCTest
@testable import MCARickAndMorty

final class APIErrorTests: XCTestCase {
    
    func test_SucceedURLErrorDescription() {
        let error = APIError.urlError
        XCTAssertEqual(error.localizedDescription, "Invalid URL or issues building the URL")
    }

    func test_SucceedParsingErrorDescription() {
        let error = APIError.parsingError
        XCTAssertEqual(error.localizedDescription, "Error when analysing the received data")
    }

    func test_SucceedNetworkErrorDescription() {
        let error = APIError.networkError
        XCTAssertEqual(error.localizedDescription, "Network connection failed")
    }

    func test_SucceedServerErrorDescription() {
        let error = APIError.serverError(statusCode: 500)
        XCTAssertEqual(error.localizedDescription, "Server error with status code: 500")
    }

    func test_SucceedUnknownErrorDescription() {
        let error = APIError.unknownError
        XCTAssertEqual(error.localizedDescription, "Unknown error")
    }
}
