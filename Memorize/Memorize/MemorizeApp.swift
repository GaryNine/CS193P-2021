//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Igor Deviatko on 07.02.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let emojiGame = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: emojiGame)
        }
    }
}
