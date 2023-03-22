//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Igor Deviatko on 08.03.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // MARK: -
    // MARK: Types
    
    typealias Card = MemoryGame<String>.Card
    
    // MARK: -
    // MARK: Static
    
    private static var theme = Theme.vehicles
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let randomEmojiIndex = Int.random(in: 8...20)
        let emojis = theme.emojis[0...randomEmojiIndex]
        return MemoryGame(numberOfPairsOfCards: randomEmojiIndex) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: -
    // MARK: Properties
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [Card] {
        return memoryGame.cards
    }
    
    // MARK: -
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    func change(theme: Theme) {
        EmojiMemoryGame.theme = theme
        memoryGame = EmojiMemoryGame.createMemoryGame()
    }
}
