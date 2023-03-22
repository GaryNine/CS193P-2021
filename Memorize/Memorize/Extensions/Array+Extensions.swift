//
//  Array+Extensions.swift
//  Memorize
//
//  Created by Igor Deviatko on 20.03.2023.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
