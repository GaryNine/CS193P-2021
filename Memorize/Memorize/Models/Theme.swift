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
    
    var name: ThemeName
    var numberOfPairsOfCards: Int
    
    // MARK: -
    // MARK: Data
    
    enum ThemeName {
        case vehicles
        case animals
        case sports
        case nature
        case smileys
        case food
        
        var emojis: [String] {
            switch self {
            case .vehicles:
                return ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐",
                        "🛻", "🚚", "🚛", "🚜", "🛵", "🛺", "🚔", "🚍", "🚘", "🚖"]
            case .sports:
                return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🚑", "🥏", "🎱",
                        "🪀", "🏓", "🏸", "🏒", "🏑", "🥍", "🏏", "🪃", "🥅", "⛳️"]
            case .animals:
                return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨",
                        "🐯", "🦁", "🐮", "🐷", "🐽", "🐸", "🐵", "🐥", "🦉", "🦅"]
            case .nature:
                return ["🌲", "🌳", "🌴", "🪵", "🌱", "🌿", "☘️", "🍀", "🎍", "🪴",
                        "🎋", "🍃", "🍂", "🍁", "🍄", "🌾", "🌷", "🪷", "🌺", "🪨"]
            case .smileys:
                return ["😀", "😃", "😄", "😁", "😆", "🤣", "😅", "😂", "☺️", "😊",
                        "🙂", "😋", "😉", "😘", "😚", "😇", "🥰", "🙃", "😙", "😗"]
            case .food:
                return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐",
                        "🍈", "🍒", "🍑", "🥭", "🥥", "🥝", "🍅", "🥑", "🍆", "🌽"]
            }
        }
        
        var colors: String {
            switch self {
            case .vehicles: return "gray"
            case .sports: return "magenta"
            case .animals: return "brown"
            case .nature: return "blue"
            case .smileys: return "yellow"
            case .food: return "green"
            }
        }
    }
}
