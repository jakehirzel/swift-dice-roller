//
//  InterfaceController.swift
//  WatchKit App Extension
//
//  Created by Jake Hirzel on 11/28/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK: Properties
    
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var resultLabelTwo: WKInterfaceLabel!
    @IBOutlet var dicePicker: WKInterfacePicker!
    @IBOutlet var rollButton: WKInterfaceButton!
    
    let dieTypes = DieTypes()
    let rollLogic = WKRollLogic()
    
    var pickerChoice: Die?
    var distributionType: DistributionType = .random
    var diceQuantity: DiceQuantity = .one
    
    var newShuffledSeries: Bool = true
    
    // MARK: WKInterfaceController Lifecycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        // Map dice types to pickerItems array
        let pickerItems: [WKPickerItem] = dieTypes.diceAvailable.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.displayName
            return pickerItem
        }
        
        // Apply values to the picker
        dicePicker.setItems(pickerItems)
        
        // Set picker to six-sided
        dicePicker.setSelectedItemIndex(1)
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Give the picker focus
        dicePicker.focus()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Convenience
    
    func roll() -> [Int] {
        
        switch distributionType {
        case .random:
            let rollResult = rollLogic.numRoll(diceRange: pickerChoice!)
            return rollResult
        case .shuffled:
            let rollResult = rollLogic.numRollShuffled(diceRange: pickerChoice!, startNewSequence: newShuffledSeries)
            newShuffledSeries = false
            return rollResult
        }
        
    }
    
    func updateResultLabels() {
        
        switch pickerChoice!.face {
        case .num:
            switch diceQuantity {
            case .one:
                let oneDieResult = roll()
                resultLabel.setText(String(oneDieResult[0]))
            case .two:
                let twoDieResult = roll()
                resultLabel.setText(String(twoDieResult[0]))
                resultLabelTwo.setText(String(twoDieResult[1]))
            }
        case .alpha:
            switch diceQuantity {
            case .one:
                break
            case .two:
                break
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func pickerChanged(_ value: Int) {
        
        // Set pickerChoice to reflect the appropriate Die
        pickerChoice = dieTypes.diceAvailable[value]
        
    }
    
    @IBAction func rollButtonTapped() {
        
        updateResultLabels()
        
    }

}
