//
//  Cardify.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 25/11/22.
//

import SwiftUI

struct Cardify: Animatable, ViewModifier {

    var rotaton: Double // in degrees
    var animatableData: Double {
        get { rotaton }
        set { rotaton = newValue }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
    
    init(isFaceUp: Bool) {
        self.rotaton = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            if rotaton < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Constants.lineWidth)
            } else {
                shape.fill()
            }
            content
                .opacity(rotaton < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotaton), axis: (0,1,0))
    }
}
