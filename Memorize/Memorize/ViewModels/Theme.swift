//
//  Theme.swift
//  Memorize
//
//  Created by Igor Deviatko on 14.03.2023.
//

import Foundation

enum Theme {
    case vehicles
    case animals
    case sports
    
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
        }
    }
}
