//
//  ContentView.swift
//  Roll
//
//  Created by Jake Hirzel on 11/29/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @State var dieTypeChoice = "Six-Sided"
    @State var dieQuantityChoice = "1 Die"
    @State var rollTypeChoice = "Standard"

    var body: some View {
        ZStack {
            Color("RollEmBlue").ignoresSafeArea()
            VStack {
                HStack(alignment: .center, spacing: 10) {
                    Text("Die 1")
                    Text("Die 2")
                }
                Button("Roll", action: { print("Roll Button Pressed.") } )
                Picker("Die Type:", selection: $dieTypeChoice) {
                    Text("Four-Sided")
                    Text("Six-Sided")
                    Text("Eight-Sided")
                    Text("Ten-Sided")
                    Text("Twelve-Sided")
                    Text("Twenty-Sided")
                    Text("A-Z")
                }
                .pickerStyle(.wheel)
                HStack(alignment: .center) {
                    Picker("Die Quantity", selection: $dieQuantityChoice) {
                        Text("1 Die")
                        Text("2 Dice")
                    }
                    .pickerStyle(.segmented)
                    Picker("RollType", selection: $rollTypeChoice) {
                        Text("Standard")
                        Text("Shuffled")
                    }
                    .pickerStyle(.segmented)
                    Button(action: { print("Roll Button Pressed.") } ) {
                        Image(systemName: "info.circle")
                    }
                }
                .padding()
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
