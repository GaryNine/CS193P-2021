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
    
    static var theme: Theme?
    
    static var color: UIColor {
        switch theme!.name.colors {
        case "gray": return .gray
        case "magenta": return .magenta
        case "bronw": return .brown
        case "blue": return .blue
        case "yellow": return .yellow
        case "green": return .green
        default: return .red
        }
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let randomIndex = Int.random(in: 8...20)
        theme = Theme(name: .vehicles, numberOfPairsOfCards: randomIndex)
        let emojis = theme!.name.emojis[0...randomIndex]
        return MemoryGame(numberOfPairsOfCards: theme!.numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: -
    // MARK: Properties
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [Card] {
        return memoryGame.cards
    }
    
    var scoreCount: Int {
        return memoryGame.scoreCount
    }
    
    // MARK: -
    // MARK: Intent(s)
    
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    func change(theme: Theme) {
//        EmojiMemoryGame.theme = theme
        memoryGame = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: -
    // MARK: Initializaition(s)
    
    // TODO: add appropriate init
//    init(with theme: Theme) { }
}
