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
    
    @IBOutlet var twoDiceSwitch: WKInterfaceSwitch!
    @IBOutlet var shuffledSwitch: WKInterfaceSwitch!
    
    // MARK: WKInterfaceController Lifecycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
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