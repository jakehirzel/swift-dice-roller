//
//  InterfaceController.swift
//  WatchKit App Extension
//
//  Created by Jake Hirzel on 11/28/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import WatchKit
import CoreMotion
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK: Properties
    
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var resultLabelTwo: WKInterfaceLabel!
    @IBOutlet var resultGroup: WKInterfaceGroup!
    @IBOutlet var resultGroupTwo: WKInterfaceGroup!
    
    var newShuffledSeries: Bool = true
    
    let rollLogic = WKRollLogic()
    
    let motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    // MARK: WKInterfaceController Lifecycle
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Look for motion events
        getDeviceMotionUpdates()
        
    }
    
    override func didAppear() {
        
        // Ensure resultLabelTwo is displayed properly
        if RollOptions.sharedInstance.diceQuantity == .two {
            self.animate(
                withDuration: 0.25,
                animations: { [weak self] in
                    self?.resultGroupTwo.setHidden(false)
                }
            )
        }
        else {
            self.animate(
                withDuration: 0.25,
                animations: { [weak self] in
                    self?.resultGroupTwo.setHidden(true)
                }
            )
        }

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        // Stop looking for motion events
        motionManager.stopDeviceMotionUpdates()
        
    }
    
    // MARK: Convenience
    
    func roll() -> [Int] {
        
        switch RollOptions.sharedInstance.distributionType {
        case .random:
            let rollResult = rollLogic.numRoll(diceRange: RollOptions.sharedInstance.pickerChoice!)
            return rollResult
        case .shuffled:
            let rollResult = rollLogic.numRollShuffled(diceRange: RollOptions.sharedInstance.pickerChoice!, startNewSequence: newShuffledSeries)
            newShuffledSeries = false
            return rollResult
        }
        
    }
    
    func updateResultLabels() {
        
        switch RollOptions.sharedInstance.pickerChoice!.face {
        case .num:
            switch RollOptions.sharedInstance.diceQuantity {
            case .one:
                let oneDieResult = roll()
                resultLabel.setText(String(oneDieResult[0]))
            case .two:
                let twoDieResult = roll()
                resultLabel.setText(String(twoDieResult[0]))
                resultLabelTwo.setText(String(twoDieResult[1]))
            }
        case .alpha:
            switch RollOptions.sharedInstance.diceQuantity {
            case .one:
                break
            case .two:
                break
            }
        }
    }
    
    func getDeviceMotionUpdates() {
        
        if !motionManager.isDeviceMotionAvailable {
            
            // Check for device motion
            print("Device motion is unavailable")
            return
            
        }
        
        // Set the update interval
        motionManager.deviceMotionUpdateInterval = 0.1
        
        // Start device motion updates
        motionManager.startDeviceMotionUpdates(to: motionQueue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if error != nil {
                print("Encountered error: \(error!)")
            }
            
            if deviceMotion != nil {
                self.processDeviceMotion(deviceMotion: deviceMotion!)
            }
        }
        
    }
    
    func processDeviceMotion(deviceMotion: CMDeviceMotion) {
        
        if deviceMotion.userAcceleration.y > 1.0 {
            print(deviceMotion.userAcceleration.y)
            updateResultLabels()
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func resultsGroupTapped(_ sender: Any) {
        
        updateResultLabels()
        
    }
    
}
