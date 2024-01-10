//
//  SingleEpisodeRequest.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import Foundation

struct SingleEpisodeRequest: URLRequestBuilder {
    typealias Response = Episode
    var apiMode: APIMode = .prod
    var method: HttpMethod = .GET
    var path: APIPath

    init(with id: Int) {
        self.path = EpisodePaths.single(id: id)
    }
}
