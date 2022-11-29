//
//  AppDelegate.swift
//  Roll
//
//  Created by Jake Hirzel on 11/22/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import SwiftUI


// To shut off UIKit version of app, comment out @UIApplicationMain line below and un-comment out @main line below.
//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

// To shut off SwiftUI version of app, comment out @main line below and un-comment out @UIApplicationMain line above.
@main
struct Roll: App {
    var body: some Scene {
        WindowGroup {
            
            // Use to bring up preview of TestView struct below.
//            TestView()
            
            // Comment out TestView and turn on ContentView() to bring up the rest of the app.
            ContentView()
            
        }
    }
}

struct TestView: View {
    var body: some View {
        Text("Hello Testing World!")
            .font(.title)
            .foregroundColor(.green)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
