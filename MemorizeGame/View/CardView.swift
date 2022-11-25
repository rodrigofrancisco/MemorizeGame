//
//  CardView.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let opacity: CGFloat = 0
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScale)
    }
}
