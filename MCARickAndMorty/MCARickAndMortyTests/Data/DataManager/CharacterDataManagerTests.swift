//
//  CharacterDataManagerTests.swift
//  MCARickAndMortyTests
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import XCTest
@testable import MCARickAndMorty

final class CharacterDataManagerTests: XCTestCase {
    
    var allCharactersDataManager: CharacterDataManager!
    var singleCharacterDataManager: CharacterDataManager!
    var allCharacterMockAPIService: MockNetworkService!
    var singleCharacterMockAPIService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        allCharacterMockAPIService = MockNetworkService(dataTypeToMock: .allCharacters)
        singleCharacterMockAPIService = MockNetworkService(dataTypeToMock: .singleCharacter)
        allCharactersDataManager = CharacterDataManager(networkService: allCharacterMockAPIService)
        singleCharacterDataManager = CharacterDataManager(networkService: singleCharacterMockAPIService)
    }
    
    override func tearDown() {
        allCharactersDataManager = nil
        singleCharacterDataManager = nil
        allCharacterMockAPIService = nil
        singleCharacterMockAPIService = nil
        super.tearDown()
    }

    func test_SucceedFetchCharacters() async throws {
        
        do {
            let request = AllCharactersResquest()
            let characters = try await allCharactersDataManager
                .fetchCharacters(for: request)
            XCTAssertNotNil(characters)
            XCTAssertTrue(characters.characters[1].id == 2)
            
        } catch {
            XCTFail("Fail to find a response")
        }
    }
    
    func test_SucceedFetchSingleCharacter() async throws {
        do {
            let request = SingleCharacterResquest(for: 2)
            let character = try await singleCharacterDataManager
                .fetchSingleCharacter(for: request)
            XCTAssertNotNil(character)
            XCTAssertTrue(character.id == 2)
        } catch {
            XCTFail("Fail to find a response")
        }
    }
    
}
