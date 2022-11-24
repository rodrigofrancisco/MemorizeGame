//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by Rodrigo Francisco on 24/11/22.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
