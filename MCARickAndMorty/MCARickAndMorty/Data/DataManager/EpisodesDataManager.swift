//
//  EpisodesDataManager.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

final class EpisodesDataManager: DataManager {
    var networkService: APIService
    
    init(networkService: APIService) {
        self.networkService = networkService
    }
    
    func fetchAll(request: AllEpisodesRequest) async throws -> EpisodeInfoResponse {
        return try await networkService.execute(for: request)
    }
}
