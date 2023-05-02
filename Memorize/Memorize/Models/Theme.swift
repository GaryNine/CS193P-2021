//
//  Theme.swift
//  Memorize
//
//  Created by Igor Deviatko on 22.03.2023.
//

import Foundation

struct Theme<Content>  {
    
    // MARK: -
    // MARK: Properties
    
    let name: ThemeName
    let emojiChoises: [Content]
    let numberOfPairsOfCards: Int
    let color: String
    
    // MARK: -
    // MARK: Data
    
    enum ThemeName: String, CaseIterable {
        case vehicles
        case animals
        case sports
        case nature
        case smileys
        case food
    }
}

extension Theme {
        
    init(name: ThemeName, emojis: [Content]) {
        let randomNumberOfPairs = Int.random(in: 8...20)
        let numberOfPairsOfCards = {
            switch name {
            case .vehicles: return randomNumberOfPairs
            case .sports: return randomNumberOfPairs
            case .animals: return randomNumberOfPairs
            default: return emojis.count
            }
        }()
        self.init(name: name, emojis: emojis, numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    init(name: ThemeName, emojis: [Content], numberOfPairsOfCards: Int) {
        let color = {
            switch name {
            case .vehicles: return "gray"
            case .sports: return "orange"
            case .animals: return "brown"
            case .nature: return "blue"
            case .smileys: return "yellow"
            case .food: return "green"
            }
        }()
        let validNumberOfPairs = min(emojis.count, numberOfPairsOfCards)
        let emojiChoises = Array(emojis[0..<validNumberOfPairs])
        self.init(name: name, emojiChoises: emojiChoises, numberOfPairsOfCards: validNumberOfPairs, color: color)
    }
}
