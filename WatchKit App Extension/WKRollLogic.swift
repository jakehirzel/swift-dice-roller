//
//  WKRollLogic.swift
//  Roll
//
//  Created by Jake Hirzel on 11/28/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import Foundation

class WKRollLogic {
    
    // Sequence arrays for shuffled resuts
    var numRepeatCheckArray: [Int] = []
    var numRepeatCheckArrayTwo: [Int] = []
    
    func numRoll(diceRange: Die) -> (numResults: [Int]?, alphaResults: [String]?) {
        
        switch diceRange.face {
        case .alpha:
            var results: [String] = []
            let numberRollForLetter = arc4random_uniform(26) + 65
            results.append(String(UnicodeScalar(numberRollForLetter)!))
            let numberRollForLetterTwo = arc4random_uniform(26) + 65
            results.append(String(UnicodeScalar(numberRollForLetterTwo)!))
            return (nil, results)
        default:
            var results: [Int] = []
            results.append(Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1))
            results.append(Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1))
            return (results, nil)
        }
        
        
    }
    
    func numRollShuffled(diceRange: Die, startNewSequence: Bool) -> [Int] {
        
        // Empty the arrays if it's the start of a new sequence
        if startNewSequence == true {
            numRepeatCheckArray.removeAll()
            numRepeatCheckArrayTwo.removeAll()
        }
        
        // Empty the arrays if the sequence has completed and is restarting
        else if numRepeatCheckArray.count == diceRange.highestValue {
            numRepeatCheckArray.removeAll()
            numRepeatCheckArrayTwo.removeAll()            
        }
        
        var results: [Int] = []
        
        var firstResult = Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1)
        while numRepeatCheckArray.contains(firstResult) {
            firstResult = Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1)
        }
        numRepeatCheckArray.append(firstResult)
        results.append(firstResult)
        
        var secondResult = Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1)
        while numRepeatCheckArrayTwo.contains(secondResult) {
            secondResult = Int(arc4random_uniform(UInt32(diceRange.highestValue)) + 1)
        }
        numRepeatCheckArrayTwo.append(secondResult)
        results.append(secondResult)
        
        return results
        
    }
    
}
