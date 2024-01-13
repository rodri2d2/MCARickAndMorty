//
//  MainCardView.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 13/1/24.
//

import SwiftUI

struct MainCardView: View {
    var Namespace: Namespace.ID
    var character: Character
    @Binding var show:Bool
    @Binding var  itemWidth: CGFloat
    var body: some View {
        GeometryReader{ geo in
            let parallaxOffset = (geo.frame(in: .global).maxX - UIScreen.main.bounds.midX) / 3
            VStack{
                Spacer()
                Text(character.name).font(.title.weight(.bold))
                    .matchedGeometryEffect(id: "titel\(character.id)", in: Namespace)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(10)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    )
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(
                getImageView()
                    .matchedGeometryEffect(id: "image\(character.id)", in: Namespace)
                    .offset(x: parallaxOffset)
                
            )
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask\(character.id)", in: Namespace)
            )
            .frame(width: itemWidth, height: 450)
            
        }
    }
    
    func getImageView() -> some View {
        if let url = URL(string: character.image) {
            return AnyView(ImageViewFrom(url: url))
        } else {
            return AnyView(Image(systemName: "person"))
        }
    }
}
