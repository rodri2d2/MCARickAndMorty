//
//  DownloadImage.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 12/1/24.
//

import Foundation
import UIKit

actor DownloadImage {
    static func loadImage(from url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw APIError.unknownError
        }
        return image
    }
}
