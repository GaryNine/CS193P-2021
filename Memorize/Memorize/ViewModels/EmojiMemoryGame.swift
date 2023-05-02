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
    
    private static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojiChoises[pairIndex]
        }
    }
    
    private static func createRandomTheme() -> Theme {
        let randomIndex = Int.random(in: 8...20)
        return Theme(numberOfPairsOfCards: randomIndex)
    }
    
    // MARK: -
    // MARK: Private Properties
    
    @Published private var memoryGame: MemoryGame<String>
    private var theme: Theme
    
    // MARK: -
    // MARK: Public Properties
    
    var cards: [Card] {
        return memoryGame.cards
    }
    var scoreCount: Int {
        return memoryGame.scoreCount
    }
    var name: String {
        return theme.name.rawValue
    }
    var color: Color {
        switch theme.color {
        case "gray": return .gray
        case "orange": return .orange
        case "brown": return .brown
        case "blue": return .blue
        case "yellow": return .yellow
        case "green": return .green
        default: return .orange
        }
    }
    
    // MARK: -
    // MARK: Intent(s)
    
    func startNewGame() {
        theme = EmojiMemoryGame.createRandomTheme()
        memoryGame = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    // MARK: -
    // MARK: Initializaition(s)
    
    init() {
        theme = EmojiMemoryGame.createRandomTheme()
        memoryGame = EmojiMemoryGame.createMemoryGame(with: theme)
    }
}
