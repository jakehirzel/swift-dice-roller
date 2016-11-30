//
//  RollOptions.swift
//  Roll
//
//  Created by Jake Hirzel on 11/29/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import Foundation

class RollOptions {
    
    var dieTypes: DieTypes
    var pickerIndex: Int
    var pickerChoice: Die
    var distributionType: DistributionType
    var diceQuantity: DiceQuantity
    var newShuffledSeries: Bool
    
    private init() {
        self.dieTypes = DieTypes()
        self.pickerIndex = 1
        self.pickerChoice = dieTypes.diceAvailable[pickerIndex] // Defaults to six-sided
        self.distributionType = .random
        self.diceQuantity = .one
        self.newShuffledSeries = true
    }
    
    static let sharedInstance = RollOptions()
    
}
