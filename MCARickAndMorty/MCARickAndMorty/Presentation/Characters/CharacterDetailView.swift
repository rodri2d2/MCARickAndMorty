//
//  CharacterDetails.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 13/1/24.
//

import SwiftUI

struct CharacterDetailView: View {
    var Namespace: Namespace.ID
    var character: Character
    @Binding var showDetail:Bool
    @State var showText = false
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Spacer()
                }
                .onAppear {
                    withAnimation (.easeInOut.delay(0.3)){
                        showText = true
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .foregroundStyle(.white)
                .background(
                    getImageView()
                        .scaledToFill()
                        .matchedGeometryEffect(id: "image\(character.id)", in: Namespace)
                )
                .overlay(alignment: .topTrailing) {
                    CloseButton {
                        showDetail = false
                    }
                    .padding()
                    .padding(.top, 32)


                }
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(character.id)", in: Namespace)
                )
                .overlay {
                    VStack(alignment:.leading){
                        Spacer()
                        Text(character.name)
                            .font(.title.weight(.bold))
                            .matchedGeometryEffect(id: "titel\(character.id)", in: Namespace)
                            .padding()
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            )
                            .padding()
                        VStack {
                            HStack {
                                 Text("Status: \(character.status)")
                                 Text("Species: \(character.species)")
                                 Text("Gender: \(character.gender)")
                             }
                            Divider()
                            
                            Text("Origin: \(character.origin.name)")
                               Text("Location: \(character.location.name)")
                            Divider()
                            Text("Seen on: \(character.episode.count) espisodes")
                                   .font(.headline)
                        }
                        .opacity(showText ? 1 : 0)
 
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(10)
                    .offset(y: 140)
                }
            }
         
        }
        .ignoresSafeArea()
    }
    

    
    func getImageView() -> some View {
        if let url = URL(string: character.image) {
            return AnyView(ImageViewFrom(url: url))
        } else {
            return AnyView(Image(systemName: "person").resizable())
        }
    }
}


//#Preview {
//    CharacterDetails()
//}
