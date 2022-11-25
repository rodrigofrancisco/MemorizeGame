//
//  Cardify.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 25/11/22.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Constants.lineWidth)
                content
            } else {
                shape.fill()
            }
        }
    }
}
