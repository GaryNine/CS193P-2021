//
//  MemoryGame.swift
//  Memorize
//
//  Created by Igor Deviatko on 23.02.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    // MARK: -
    // MARK: Properties
    
    private(set) var cards: [Card]
    private(set) var scoreCount = 0
    
    private var lastActionDate = Date()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    // MARK: -
    // MARK: Public Functions
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            let currentDate = Date()
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                let timeInterval = Int(currentDate.timeIntervalSince(lastActionDate))
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
                setScoreForCards(at: [chosenIndex, potentialMatchIndex], with: timeInterval)
                cards[chosenIndex].haveBeenSeen = true
                cards[potentialMatchIndex].haveBeenSeen = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
                lastActionDate = currentDate
            }
        }
    }
    
    // MARK: -
    // MARK: Private Functions
    
    mutating private func setScoreForCards(at indices: [Int], with timeInterval: Int) {
        var possibleScoreCount = 0
        indices.forEach { index in
            if cards[index].isMatched {
                possibleScoreCount += 1
            } else {
                if cards[index].haveBeenSeen {
                    possibleScoreCount -= 1
                }
            }
        }
        if possibleScoreCount != 0 {
            scoreCount += max((10 - timeInterval), 1) * possibleScoreCount
        }        
    }
    
    // MARK: -
    // MARK: Initializations
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    // MARK: -
    // MARK: Data
    
    struct Card: Identifiable {
        var haveBeenSeen = false
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
