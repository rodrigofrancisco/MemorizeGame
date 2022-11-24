//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🚑", "🚓", "🚚", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚃", "🏍", "🛺", "🚠", "🛵", "🚗", "🚛", "🚇", "🛻", "🚝"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
