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
    
    let dieTypes = DieTypes()
    
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
        
        // Give the picker focus
        dicePicker.focus()
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
