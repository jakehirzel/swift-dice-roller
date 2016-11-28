//
//  ViewController.swift
//  Roll
//
//  Created by Jake Hirzel on 11/22/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultLabelTwo: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var dicePicker: UIPickerView!
    @IBOutlet weak var distributionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var diceQuantitySegmentedControl: UISegmentedControl!
    
    let dieTypes = DieTypes()
    let rollLogic = RollLogic()
    
    var pickerChoice: Die?
    var distributionType: DistributionType = .random
    var diceQuantity: DiceQuantity = .one
    
    var newShuffledSeries: Bool = true

    // MARK: ViewController Lifecycle / View Handling
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up Picker View with default values
        self.dicePicker.delegate = self
        self.dicePicker.dataSource = self
        dicePicker.selectRow(1, inComponent: 0, animated: false)
        pickerChoice = dieTypes.diceAvailable[1]
        
        // Set up Segmented Controls with default values
        distributionSegmentedControl.selectedSegmentIndex = 0
        diceQuantitySegmentedControl.selectedSegmentIndex = 0
        
        // Add borders to the result labels
        resultLabel.layer.borderWidth = 1.0
        resultLabel.layer.borderColor = UIColor.black.cgColor
        resultLabel.layer.cornerRadius = 8.0
        
        resultLabelTwo.layer.borderWidth = 1.0
        resultLabelTwo.layer.borderColor = UIColor.black.cgColor
        resultLabelTwo.layer.cornerRadius = 8.0
        
        dicePicker.layer.borderWidth = 1.0
        dicePicker.layer.borderColor = UIColor.white.cgColor
        dicePicker.layer.cornerRadius = 4.0
        
        // Ensure resultLabelTwo is invisible
        resultLabelTwo.isHidden = true
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        // Initiate a roll when device is shaken
        if motion == .motionShake {
            rollButtonTapped(rollButton)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dieTypes.diceAvailable.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        // Load the pickerView text and set color to white
        let unformattedLabel = dieTypes.diceAvailable[row].displayName
        return NSAttributedString(string: unformattedLabel, attributes: [NSForegroundColorAttributeName:UIColor.white])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerChoice = dieTypes.diceAvailable[row]
        
        // Any change in settings resets the shuffle seed
        newShuffledSeries = true
        
    }
    
    // MARK: Convenience
    
    func roll() -> (numResults: [Int]?, alphaResults: [String]?) {
        
        guard pickerChoice != nil else {
            
            // Should never be called, because defaults are set in viewDidLoad(); will reset to random 6-sided roll
            dicePicker.selectRow(1, inComponent: 0, animated: true)
            distributionSegmentedControl.selectedSegmentIndex = 0
            let defaultResult = rollLogic.numRoll(diceRange: dieTypes.diceAvailable[1])
            print("Default roll!")
            return (defaultResult, nil)
            
        }
        
        switch distributionType {
        case .random:
            
            switch pickerChoice!.face {
            case .num:
                let rollResult = rollLogic.numRoll(diceRange: pickerChoice!)
                return (rollResult, nil)
            case .alpha:
                let rollResult = rollLogic.alphaRoll(diceRange: pickerChoice!)
                return (nil, rollResult)
            }
            
        case .shuffled:
            
            switch pickerChoice!.face {
            case .num:
                let rollResult = rollLogic.numRollShuffled(diceRange: pickerChoice!, needNewSeed: newShuffledSeries)
                newShuffledSeries = false
                print("roll() set seed to false.")
                return (rollResult, nil)
            case .alpha:
                let rollResult = rollLogic.alphaRollShuffled(diceRange: pickerChoice!, needNewSeed: newShuffledSeries)
                newShuffledSeries = false
                print("roll() set seed to false.")
                return (nil, rollResult)
            }
            
        }
        
    }
    
    func updateResultLabels() {
        
        switch pickerChoice!.face {
        case .num:
            
            switch diceQuantity {
            case .one:
                
                let oneDieResult = roll()
                resultLabel.fadeOut()
                resultLabel.pulseOnce(delay: 0.0)
                resultLabel.text = String(oneDieResult.numResults![0])
                resultLabel.fadeIn()
                
            case .two:
                
                let twoDieResult = roll()
                resultLabelTwo.isHidden = false
                resultLabel.fadeOut()
                resultLabel.pulseOnce(delay: 0.0)
                resultLabelTwo.fadeOut()
                resultLabelTwo.pulseOnce(delay: 0.0)
                resultLabel.text = String(twoDieResult.numResults![0])
                resultLabelTwo.text = String(twoDieResult.numResults![1])
                resultLabel.fadeIn()
                resultLabelTwo.fadeIn()
                
            }
            
        case .alpha:
            
            switch diceQuantity {
            case .one:
                
                let oneDieResult = roll()
                resultLabel.fadeOut()
                resultLabel.pulseOnce(delay: 0.0)
                resultLabel.text = oneDieResult.alphaResults![0]
                resultLabel.fadeIn()
                
            case .two:
                
                let twoDieResult = roll()
                resultLabelTwo.isHidden = false
                resultLabel.fadeOut()
                resultLabel.pulseOnce(delay: 0.0)
                resultLabelTwo.fadeOut()
                resultLabelTwo.pulseOnce(delay: 0.0)
                resultLabel.text = twoDieResult.alphaResults![0]
                resultLabelTwo.text = twoDieResult.alphaResults![1]
                resultLabel.fadeIn()
                resultLabelTwo.fadeIn()
                
            }
            
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        updateResultLabels()
        
    }
    
    @IBAction func diceTapped(_ sender: UITapGestureRecognizer) {
        
        updateResultLabels()
        
    }
    
    @IBAction func distributionChanged(_ sender: UISegmentedControl) {
        
        // Any change in settings resets the shuffle seed
        newShuffledSeries = true
        
        switch distributionSegmentedControl.selectedSegmentIndex {
        case 0:
            distributionType = .random
        case 1:
            distributionType = .shuffled
        default:
            distributionType = .random
        }
        
    }
    
    @IBAction func diceQuantityChanged(_ sender: UISegmentedControl) {
        
        // Any change in settings resets the shuffle seed
        newShuffledSeries = true
        
        switch diceQuantitySegmentedControl.selectedSegmentIndex {
        case 0:
            diceQuantity = .one
            resultLabelTwo.isHidden = true
        case 1:
            diceQuantity = .two
            resultLabelTwo.text = "?"
            resultLabelTwo.isHidden = false
        default:
            diceQuantity = .one
            resultLabelTwo.isHidden = true
        }
        
    }
    
    
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        
    }

}

