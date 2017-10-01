//
//  InfoViewController.swift
//  Roll
//
//  Created by Jake Hirzel on 11/24/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Convenience
    
    func rateUs() {
        
        // Set the App Store URL
        let appstoreURL = "https://itunes.apple.com/us/app/rollem/id1179036062?mt=8"

        guard let url = URL(string: "\(appstoreURL)&action=write-review") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    // MARK: Actions
    
    @IBAction func rateButtonTapped(_ sender: UIButton) {
        
        rateUs()
        
    }
    
    
}
