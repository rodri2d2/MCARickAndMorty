//
//  CloseButton.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 13/1/24.
//

import SwiftUI

struct CloseButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.title3).bold()
                .foregroundStyle(.black)
                .padding(10)
                .background(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CloseButton {
        
    }
}
