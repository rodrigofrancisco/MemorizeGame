//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    drawCards
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
    var drawCards: some View {
        ForEach(viewModel.cards) { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
    }
}
