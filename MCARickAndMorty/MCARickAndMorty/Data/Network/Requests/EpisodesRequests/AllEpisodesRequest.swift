//
//  AllEpisodesRequest.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct AllEpisodesRequest: URLRequestBuilder {
    typealias Response = EpisodeInfoResponse
    var apiMode: APIMode = .prod
    var method: HttpMethod = .GET
    var path: APIPath = EpisodePaths.all
}


