//
//  HttpMethodTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 8/1/24.
//

import XCTest
@testable import MCARickAndMorty

class HttpMethodTests: XCTestCase {
    
    func test_SuccessToGetGETMethod() {
        XCTAssertEqual(HttpMethod.GET.rawValue, "GET")
    }
    func test_SuccessToGetPOSTMethod() {
        XCTAssertEqual(HttpMethod.POST.rawValue, "POST")
    }
    func test_SuccessToGetPUTMethod() {
        XCTAssertEqual(HttpMethod.PUT.rawValue, "PUT")
    }
    func test_SuccessToGetDELETEMethod() {
        XCTAssertEqual(HttpMethod.DELETE.rawValue, "DELETE")
    }
    
}
