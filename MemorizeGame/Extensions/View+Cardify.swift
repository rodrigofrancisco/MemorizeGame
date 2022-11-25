//
//  View+Cardify.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 25/11/22.
//

import SwiftUI

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
