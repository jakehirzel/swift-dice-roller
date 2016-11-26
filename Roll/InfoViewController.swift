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
        
        // Set the App ID
        let appID = "1179036062"
        
        // Check for valid URL & open if valid
        if let checkURL = URL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8") {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(checkURL, options: [:], completionHandler: { (success) in
                    print("Open \(checkURL): \(success)")
                })
            }
            else {
                UIApplication.shared.openURL(checkURL)
                print("Open \(checkURL) successful")
            }
        }
        else {
            print("Invalid URL")
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func rateButtonTapped(_ sender: UIButton) {
        
        rateUs()
        
    }
    
    
}
