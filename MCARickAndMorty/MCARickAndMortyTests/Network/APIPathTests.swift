//
//  APIPathTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 9/1/24.
//

import XCTest
@testable import MCARickAndMorty

class APIPathTests: XCTestCase {

    // MARK: Suceess
    func test_SucceedCharacterPathsAll() {
        let path = CharacterPaths.all
        XCTAssertEqual(path.path, "character")
    }

    func test_SucceedCharacterPathsSingle() {
        let path = CharacterPaths.single(id: 1)
        XCTAssertEqual(path.path, "character/1")
    }

    func test_SucceedEpisodePathsAll() {
        let path = EpisodePaths.all
        XCTAssertEqual(path.path, "episode")
    }

    func test_SucceedEpisodePathsSingle() {
        let path = EpisodePaths.single(id: 1)
        XCTAssertEqual(path.path, "episode/1")
    }
    
    // MARK: Fails
    func test_FailCharacterPathsSingleWithInvalidId() {
        let path = CharacterPaths.single(id: 1)
        XCTAssertNotEqual(path.path, "character/-1")
    }

    func test_FailEpisodePathsSingleWithInvalidId() {
        let path = EpisodePaths.single(id: 1)
        XCTAssertNotEqual(path.path, "episode/-1")
    }
}
