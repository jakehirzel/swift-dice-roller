//
//  OptionsInterfaceController.swift
//  Roll
//
//  Created by Jake Hirzel on 11/28/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import WatchKit
import Foundation


class OptionsInterfaceController: WKInterfaceController {
    
    // MARK: Properties
    
    @IBOutlet var dicePicker: WKInterfacePicker!
    @IBOutlet var twoDiceSwitch: WKInterfaceSwitch!
    @IBOutlet var shuffledSwitch: WKInterfaceSwitch!
    
    // MARK: WKInterfaceController Lifecycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        // Map dice types to pickerItems array
        let pickerItems: [WKPickerItem] = RollOptions.sharedInstance.dieTypes.diceAvailable.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.displayName
            pickerItem.caption = "Die Type"
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
    
    // MARK: Actions
    
    @IBAction func pickerChanged(_ value: Int) {
        
        // Set pickerChoice to reflect the appropriate Die
        RollOptions.sharedInstance.pickerChoice = RollOptions.sharedInstance.dieTypes.diceAvailable[value]
        
    }
    
    @IBAction func twoDiceSwitchOn(_ value: Bool) {
        
        if value == true {
            RollOptions.sharedInstance.diceQuantity = .two
        }
        else {
            RollOptions.sharedInstance.diceQuantity = .one
        }
        
    }
    
    @IBAction func shuffledSwitchOn(_ value: Bool) {
        
        if value == true {
            RollOptions.sharedInstance.distributionType = .shuffled
        }
        else {
            RollOptions.sharedInstance.distributionType = .random
        }
        
    }
    
    
}
