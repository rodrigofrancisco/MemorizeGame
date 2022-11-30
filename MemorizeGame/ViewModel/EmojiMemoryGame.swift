//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🚑", "🚓", "🚚", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚃", "🏍", "🛺", "🚠", "🛵", "🚗", "🚛", "🚇", "🛻", "🚝"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [Card] {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
