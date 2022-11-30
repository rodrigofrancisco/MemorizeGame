//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            gameBody
            shuffle
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
            drawCardView(for: card)
        }
        .onAppear {
            // "deal" cards
            withAnimation {
                for card in viewModel.cards {
                    deal(card)
                }
            }
        }
        .foregroundColor(.red)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 5)) {
                viewModel.shuffle()
            }
        }
    }
    
    @ViewBuilder private func drawCardView(for card: EmojiMemoryGame.Card) -> some View {
        if isUndealt(card) || card.isMatched && !card.isFaceUp {
            Color.clear
        } else {
            CardView(card: card)
                .padding(4)
                .transition(.asymmetric(insertion: .scale, removal: .opacity).animation(.easeInOut(duration: 3)))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: game)
    }
}
