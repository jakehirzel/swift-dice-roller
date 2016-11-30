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
    
//    var newShuffledSeries: Bool = true
    
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
    
    func roll() -> (numResults: [Int]?, alphaResults: [String]?) {
        
        switch RollOptions.sharedInstance.distributionType {
        case .random:
            switch RollOptions.sharedInstance.pickerChoice.face {
            case .num:
                let rollResult = rollLogic.numRoll(diceRange: RollOptions.sharedInstance.pickerChoice).numResults!
                return (rollResult, nil)
            case .alpha:
                let rollResult = rollLogic.numRoll(diceRange: RollOptions.sharedInstance.pickerChoice).alphaResults!
                return (nil, rollResult)

            }
        case .shuffled:
            switch RollOptions.sharedInstance.pickerChoice.face {
            case .num:
                let rollResult = rollLogic.numRollShuffled(diceRange: RollOptions.sharedInstance.pickerChoice, startNewSequence: RollOptions.sharedInstance.newShuffledSeries).numResults!
                RollOptions.sharedInstance.newShuffledSeries = false
                return (rollResult, nil)
            case .alpha:
                let rollResult = rollLogic.numRollShuffled(diceRange: RollOptions.sharedInstance.pickerChoice, startNewSequence: RollOptions.sharedInstance.newShuffledSeries).alphaResults
                RollOptions.sharedInstance.newShuffledSeries = false
                return (nil, rollResult)
            }
        }
        
    }
    
    func updateResultLabels() {
        
        switch RollOptions.sharedInstance.pickerChoice.face {
        case .num:
            switch RollOptions.sharedInstance.diceQuantity {
            case .one:
                let oneDieResult = roll().numResults
                animateResultLabel(label: resultLabel, labelTwo: nil, result: String(describing: (oneDieResult?[0])!), resultTwo: nil)
            case .two:
                let twoDieResult = roll().numResults
                animateResultLabel(label: resultLabel, labelTwo: resultLabelTwo, result: String(describing: (twoDieResult?[0])!), resultTwo: String(describing: (twoDieResult?[1])!))
            }
        case .alpha:
            switch RollOptions.sharedInstance.diceQuantity {
            case .one:
                let oneDieResult = roll().alphaResults
                animateResultLabel(label: resultLabel, labelTwo: nil, result: (oneDieResult?[0])!, resultTwo: nil)
            case .two:
                let twoDieResult = roll().alphaResults
                animateResultLabel(label: resultLabel, labelTwo: resultLabelTwo, result: (twoDieResult?[0])!, resultTwo: twoDieResult?[1])
            }
        }
    }
    
    func animateResultLabel(label: WKInterfaceLabel, labelTwo: WKInterfaceLabel?, result: String, resultTwo: String?) {
        
        animate(
            withDuration: 0.25,
            animations: {
                label.setAlpha(0.0)
                label.setVerticalAlignment(.top)
                labelTwo?.setAlpha(0.0)
                labelTwo?.setVerticalAlignment(.top)
            }
        )
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + 0.25,
            execute: { [weak self] in
                label.setText(result)
                labelTwo?.setText(resultTwo)
                self?.animate(
                    withDuration: 0.125,
                    animations: {
                        label.setAlpha(1.0)
                        label.setVerticalAlignment(.center)
                        labelTwo?.setAlpha(1.0)
                        labelTwo?.setVerticalAlignment(.center)
                    }
                )
            }
        )
        
    }
    
    // General function for starting to read device motion updates; requires a function to process specific device motion as well as a call to motionManager.stopDeviceMotionUpdates() -- most likely in didDeactivate(); also requires CMMotionManager() and OperationQueue() properties
    func getDeviceMotionUpdates() {
        
        // Make sure device motion is available
        if !motionManager.isDeviceMotionAvailable {
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
