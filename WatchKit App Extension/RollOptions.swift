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
    var pickerChoice: Die?
    var distributionType: DistributionType
    var diceQuantity: DiceQuantity
    
    private init() {
        self.dieTypes = DieTypes()
        self.distributionType = .random
        self.diceQuantity = .one
    }
    
    static let sharedInstance = RollOptions()
    
}
