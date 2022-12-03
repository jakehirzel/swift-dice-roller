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
        TabView {
            ZStack {
                Color("RollEmBlue")
                    .ignoresSafeArea(.all, edges: .top)
                VStack {
                    HStack(alignment: .center, spacing: 10) {
                        Text("24")
                            .frame(width: 100, height: 100)
                            .font(.system(size: 70, weight: .black))
                            .foregroundColor(Color("RollEmBlue"))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                            )
                        Text("2")
                            .frame(width: 100, height: 100)
                            .font(.system(size: 70, weight: .black))
                            .foregroundColor(Color("RollEmBlue"))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(.white)
                            )
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
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Roll")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .tabItem {
                    Image(systemName: "dice")
                    Text("Roll")
                }
            Text("Info")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Info")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
