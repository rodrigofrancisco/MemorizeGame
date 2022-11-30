//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    struct Constants {
        static let aspectRatio: CGFloat = 2/3
        static let undealtHeight: CGFloat = 90
        static let undealWidth = undealtHeight * aspectRatio
        static let cardColor: Color = .red
        
        static let totalDuration = 2.0
        static let dealDuration = 1.0
    }
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack {
            gameBody
            deckBody
            shuffle
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()

    var gameBody: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: Constants.aspectRatio) { card in
            drawCardView(for: card)
        }
        .foregroundColor(Constants.cardColor)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 5)) {
                viewModel.shuffle()
            }
        }
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(viewModel.cards.filter(isUndealt)) { card in
                CardView(card: card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .opacity, removal: .identity))
            }
        }
        .frame(width: Constants.undealWidth, height: Constants.undealtHeight)
        .foregroundColor(Constants.cardColor)
        .onTapGesture {
            // "deal" cards
            for card in viewModel.cards {
                withAnimation(dealAnimation(for: card)) {
                    deal(card)
                }
            }
        }
    }
    
    @ViewBuilder private func drawCardView(for card: EmojiMemoryGame.Card) -> some View {
        if isUndealt(card) || card.isMatched && !card.isFaceUp {
            Color.clear
        } else {
            CardView(card: card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .padding(4)
                .transition(.asymmetric(insertion: .identity, removal: .opacity))
                .zIndex(zIndex(of: card))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
    }
    
    private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
        -Double(viewModel.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
        var delay = 0.0
        if let index = viewModel.cards.firstIndex(where: { $0.id == card.id} ) {
            delay = Double(index) * (Constants.totalDuration / Double(viewModel.cards.count))
        }
        return Animation.easeInOut(duration: Constants.dealDuration).delay(delay)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: game)
    }
}
