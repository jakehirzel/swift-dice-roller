//
//  ContentView.swift
//  Roll
//
//  Created by Jake Hirzel on 11/29/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @State var dicePickerChoice = "Six-Sided"

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Text("Die 1")
                Text("Die 2")
            }
            Button("Roll", action: { print("Roll Button Pressed.") } )
            Picker("Die Type:", selection: $dicePickerChoice) {
                Text("Four-Sided")
                Text("Six-Sided")
                Text("Eight-Sided")
                Text("Ten-Sided")
                Text("Twelve-Sided")
                Text("Twenty-Sided")
                Text("A-Z")
            }
            .pickerStyle(.wheel)
            HStack(alignment: .center, spacing: 10) {
                Text("Segmented Control 1")
                Text("Segmented Control 2")
                Text("Info Button")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
