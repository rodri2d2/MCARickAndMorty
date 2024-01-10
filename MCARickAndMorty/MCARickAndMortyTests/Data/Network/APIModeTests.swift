//
//  APIModeTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import XCTest
@testable import MCARickAndMorty

final class APIModeTests: XCTestCase {
    
    func testApiModeDev() {
        let mode = APIMode.dev
        XCTAssertEqual(mode.host, APIConfig.devURL, "DEV mode URL must be equal")
    }

    func testApiModeProd() {
        let mode = APIMode.prod
        XCTAssertEqual(mode.host, APIConfig.prodURL, "PROD mode URL must be equal")
    }

}
