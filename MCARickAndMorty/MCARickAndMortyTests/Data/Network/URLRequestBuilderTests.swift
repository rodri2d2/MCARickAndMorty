//
//  URLRequestBuilderTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import XCTest
@testable import MCARickAndMorty

final class URLRequestBuilderTests: XCTestCase {
    
    func test_SucceedURLRequestCreation() {
        let builder = MockURLRequestBuilder()
        let request = builder.buildRequest()
        
        XCTAssertEqual(request.url?.absoluteString, "https://rickandmortyapi-dev.com/api/testPath?key=value")
        XCTAssertEqual(request.httpMethod, HttpMethod.GET.rawValue)
    }
    
    func testURLRequestHeaders() {
        let builder = MockURLRequestBuilder()
        let request = builder.buildRequest()
        
        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Accept"), "application/json")
        XCTAssertEqual(request.value(forHTTPHeaderField: "Custom-Header"), "CustomValue")
    }
    
    func test_SucceedURLRequestWithParameters() {
        let builder = MockURLRequestBuilder()
        let request = builder.buildRequest()
        XCTAssertTrue(request.url?.absoluteString.contains("key=value") ?? false)
    }
    
    func test_SucceedURLRequestWithBody() {
        let builder = MockURLRequestBuilder()
        let request = builder.buildRequest()
        XCTAssertNotNil(request.httpBody)
    }
    
}
