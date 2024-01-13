//
//  CharactersView.swift
//  MCARickAndMorty
//
//  Created by Rodrigo  Candido on 10/1/24.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject var viewModel: CharactersViewModel
    @Namespace var Namespace
    @State private var showDetail = false
    @State var selectedCharacter: Character?
    
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0
    @State var itemWidth: CGFloat = 340
    private let peekAmount: CGFloat = -10
    private let dragThreshold: CGFloat = 100
    private let gradient = LinearGradient(
        gradient: Gradient(colors: [.yellow.opacity(0.2), .green.opacity(0.45)]),
        startPoint: .top,
        endPoint: .bottom)
    
    private var numberOfItems: Int {
        return viewModel.characters.count
    }
    
    var body: some View {
        ZStack {
            gradient
                .ignoresSafeArea()
            
            if !showDetail {
                carouselView
                
            }
            
            if let selectedCharacter = selectedCharacter, showDetail {
                CharacterDetailView(Namespace: Namespace, character: selectedCharacter, showDetail: $showDetail)
            }
        }
        
        .task {
            await viewModel.loadCharacters()
        }
    }

    private var carouselView: some View {
        GeometryReader{ geometry in
            HStack(spacing:peekAmount){
                ForEach(Array(viewModel.characters.enumerated()), id: \.element.id) { index, character in
                    characterCard(for: character, in: geometry)
                        .scaleEffect(self.scaleValueForItem(at: index, in: geometry))
                }
            }
            .offset(x: calculateOffset() + dragOffset, y: geometry.size.height / 4 )
            .gesture(dragGesture)
        }
    }
    
    private func characterCard(for character: Character, in geometry: GeometryProxy) -> some View {
        MainCardView(Namespace: Namespace, character: character, show: $showDetail, itemWidth: $itemWidth)
            .frame(width: itemWidth)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    showDetail.toggle()
                    selectedCharacter = character
                }
            }
    }
    
    private var dragGesture: some Gesture {
        DragGesture(coordinateSpace: .global)
            .onChanged({ value in
                withAnimation(.interactiveSpring()) {
                    dragOffset = value .translation.width
                }
            })
            .onEnded({ value in
                withAnimation(.interactiveSpring()) {
                    finalizePosition(dragValue: value)
                    dragOffset =  0
                }
            })
    }
    
    /// Calculates the horizontal offset for the `HStack` of items.
    /// - Returns: The computed offset based on the current index.
    func calculateOffset() -> CGFloat {
        // Compute the total width of an item, including the peek amount (the visible part of neighboring items)
        let totalItemWidth = itemWidth + peekAmount
        // Calculate the base offset based on the current item's index. Multiply with the negative value to move items left.
        let baseOffset = -CGFloat(currentIndex) * totalItemWidth
        return baseOffset
    }
    func scaleValueForItem(at index: Int, in geometry: GeometryProxy) -> CGFloat {
        // Calculate the current item's offset including any dragging offset
        let currentItemOffset = calculateOffset() + dragOffset
        // Calculate the position of the item based on its index
        let itemPosition = CGFloat(index) * (itemWidth + peekAmount) + currentItemOffset
        // Calculate how far the item is from the center of the screen
        let distanceFromCenter = abs(geometry.size.width / 2 - itemPosition - itemWidth / 2)
        // Calculate the scale value based on its distance from the center
        let scale: CGFloat = 0.8 + (0.2 * (1 - min(1, distanceFromCenter / (itemWidth + peekAmount))))
        return scale
    }
    /// Finalizes the position of the carousel after a drag gesture has ended.
    /// - Parameter dragValue: The value that encapsulates the properties of the drag gesture.
    func finalizePosition(dragValue: DragGesture.Value) {
        // Check if the drag was to the right and exceeds the threshold, and we're not already at the first item
        if dragValue.predictedEndTranslation.width > dragThreshold && currentIndex > 0 {
            currentIndex -= 1  // Decrement the current index
        }
        // Check if the drag was to the left and exceeds the threshold, and we're not already at the last item
        else if dragValue.predictedEndTranslation.width < -dragThreshold && currentIndex < numberOfItems - 1 {
            currentIndex += 1  // Increment the current index
        }
    }
}
