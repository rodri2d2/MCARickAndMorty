//
//  ImageViewFrom.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 12/1/24.
//

import SwiftUI

struct ImageViewFrom: View {
    let url: URL

    @State private var image: UIImage?
    
    var body: some View {
        
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
                    .accentColor(.white)
            }
        }
        .onAppear {
            Task {
                image = try await DownloadImage.loadImage(from: url)
            }
        }
    }
}

//#Preview {
//    ImageViewFrom(url: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
//}
