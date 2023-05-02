//
//  Theme.swift
//  Memorize
//
//  Created by Igor Deviatko on 22.03.2023.
//

import Foundation

struct Theme {
    
    // MARK: -
    // MARK: Properties
    
    let name: ThemeName
    let numberOfPairsOfCards: Int
    let emojiChoises: [String]
    let color: String
    
    // MARK: -
    // MARK: Static
    
    private static func getEmoji(by themeName: ThemeName) -> [String] {
        switch themeName {
        case .vehicles:
            return ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐",
                    "🛻", "🚚", "🚛", "🚜", "🛵", "🛺", "🚔", "🚍", "🚘", "🚖"].shuffled()
        case .sports:
            return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🚑", "🥏", "🎱",
                    "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳️"].shuffled()
        case .animals:
            return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨",
                    "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🐥", "🦉", "🦅"].shuffled()
        case .nature:
            return ["🌲", "🌳", "🌴", "🪵", "🌱", "🌿", "☘️", "🍀", "🎍", "🪴",
                    "🎋", "🍃", "🍂", "🍁", "🍄", "🌾", "🌷", "🪷", "🌺", "🪨"].shuffled()
        case .smileys:
            return ["😀", "😃", "😄", "😁", "😆", "🤣", "😅", "😂", "☺️", "😊",
                    "🙂", "😋", "😉", "😘", "😚", "😇", "🥰", "🙃", "😙", "😗"].shuffled()
        case .food:
            return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐",
                    "🍈", "🍒", "🍑", "🥭", "🥥", "🥝", "🍅", "🥑", "🍆", "🌽"].shuffled()
        }
    }
    
    // MARK: -
    // MARK: Initialization(s)
    
    init() {
        let randomThemeName = ThemeName.allCases.randomElement() ?? ThemeName.vehicles
        let numberOfPairsOfCards = Theme.getEmoji(by: randomThemeName).count
        self.init(name: randomThemeName, numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    init(name: ThemeName) {
        let randomNumberOfPairs = Int.random(in: 8...20)
        let maximumNumberOfPairs = Theme.getEmoji(by: name).count
        let numberOfPairsOfCards = {
            switch name {
            case .vehicles: return randomNumberOfPairs
            case .sports: return randomNumberOfPairs
            case .animals: return randomNumberOfPairs
            default: return maximumNumberOfPairs
            }
        }()
        self.init(name: name, numberOfPairsOfCards: numberOfPairsOfCards)
    }

    init(numberOfPairsOfCards: Int) {
        let randomThemeName = ThemeName.allCases.randomElement() ?? ThemeName.vehicles
        self.init(name: randomThemeName, numberOfPairsOfCards: numberOfPairsOfCards)
    }

    private init(name: ThemeName, numberOfPairsOfCards: Int) {
        self.name = name
        let emojis = Theme.getEmoji(by: name)
        self.numberOfPairsOfCards = min(emojis.count, numberOfPairsOfCards)
        self.emojiChoises =  Array(emojis[0...numberOfPairsOfCards])
        self.color = {
            switch name {
            case .vehicles: return "gray"
            case .sports: return "orange"
            case .animals: return "brown"
            case .nature: return "blue"
            case .smileys: return "yellow"
            case .food: return "green"
            }
        }()
    }
    
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
