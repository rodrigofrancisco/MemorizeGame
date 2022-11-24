//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}
