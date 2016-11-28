//
//  RollStructsAndEnums.swift
//  Roll
//
//  Created by Jake Hirzel on 11/28/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import Foundation

enum DieFace {
    case num
    case alpha
}

enum DistributionType {
    case random
    case shuffled
}

enum DiceQuantity: Int {
    case one = 1
    case two = 2
}

struct Die {
    let name: String
    let displayName: String
    let lowestValue: Int
    let highestValue: Int
    let face: DieFace
}

struct DieTypes {
    let diceAvailable: [Die] = [
        Die(name: "fourSidedNum", displayName: "Four-Sided", lowestValue: 1, highestValue: 4, face: .num),
        Die(name: "sixSidedNum", displayName: "Six-Sided", lowestValue: 1, highestValue: 6, face: .num),
        Die(name: "eightSidedNum", displayName: "Eight-Sided", lowestValue: 1, highestValue: 8, face: .num),
        Die(name: "tenSided0to9", displayName: "Ten-Sided", lowestValue: 0, highestValue: 9, face: .num),
        Die(name: "twelveSidedNum", displayName: "Twelve-Sided", lowestValue: 1, highestValue: 12, face: .num),
        Die(name: "twentySidedNum", displayName: "Twenty-Sided", lowestValue: 1, highestValue: 20, face: .num),
        Die(name: "twentySixSidedAlpha", displayName: "A-Z", lowestValue: 1, highestValue: 26, face: .alpha)
    ]
}
