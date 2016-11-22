//
//  RollLogic.swift
//  Roll
//
//  Created by Jake Hirzel on 11/22/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import Foundation
import GameplayKit

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

class RollLogic {
    
    // Create a seed variables to enable shuffled distribution across two separate die
    var shuffledDiceToRoll: GKShuffledDistribution?
    var shuffledDiceToRollTwo: GKShuffledDistribution?
    
    func numRoll(diceRange: Die) -> [Int] {
        
        let diceToRoll = GKRandomDistribution(lowestValue: diceRange.lowestValue, highestValue: diceRange.highestValue)
        var results: [Int] = []
        results.append(diceToRoll.nextInt())
        results.append(diceToRoll.nextInt())
        return results
        
    }
    
    func numRollShuffled(diceRange: Die, needNewSeed: Bool) -> [Int] {
        
        // Put new seed in shuffledDiceToRoll if this is the first of a series
        if needNewSeed == true {
            shuffledDiceToRoll = GKShuffledDistribution(lowestValue: diceRange.lowestValue, highestValue: diceRange.highestValue)
            shuffledDiceToRollTwo = GKShuffledDistribution(lowestValue: diceRange.lowestValue, highestValue: diceRange.highestValue)
        }
        
        var results: [Int] = []
        results.append(shuffledDiceToRoll!.nextInt())
        results.append(shuffledDiceToRollTwo!.nextInt())
        print("Num Shuffle")
        print(results)
        return results
        
    }
    
    func alphaRoll(diceRange: Die) -> [String] {
        
        let numberRollForLetter = Int(GKRandomSource.sharedRandom().nextInt(upperBound: diceRange.highestValue) + 65)
        var characterString = ""
        characterString.append(Character(UnicodeScalar(numberRollForLetter)!))
        var results: [String] = []
        results.append(characterString)
        return results
        
    }
    
    func alphaRollShuffled(diceRange: Die, needNewSeed: Bool) -> [String] {
        
        // Check if this is the first roll of the series
        if needNewSeed == true {
            shuffledDiceToRoll = GKShuffledDistribution(lowestValue: diceRange.lowestValue, highestValue: diceRange.highestValue)
            shuffledDiceToRollTwo = GKShuffledDistribution(lowestValue: diceRange.lowestValue, highestValue: diceRange.highestValue)
        }
        
        let numberRollForLetter = shuffledDiceToRoll!.nextInt() + 64
        var characterString = ""
        characterString.append(Character(UnicodeScalar(numberRollForLetter)!))
        var results: [String] = []
        results.append(characterString)
        
        let numberRollForLetterTwo = shuffledDiceToRollTwo!.nextInt() + 64
        var characterStringTwo = ""
        characterStringTwo.append(Character(UnicodeScalar(numberRollForLetterTwo)!))
        results.append(characterStringTwo)
        
        print("Alpha Shuffle")
        print(results)
        
        return results
        
    }
    
}

