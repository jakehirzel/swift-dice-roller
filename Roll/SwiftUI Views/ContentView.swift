//
//  ContentView.swift
//  Roll
//
//  Created by Jake Hirzel on 11/29/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    let diceAvailable = DieTypes().diceAvailable
    let rollLogic = RollLogic()
    
//    var distributionType: DistributionType = .random
//    var diceQuantity: DiceQuantity = .one
    
    var newShuffledSeries: Bool = true
    
    @State var showSettingsPopover = false
    @State var showAboutPopover = false
    @State var dieTypeChoice = "sixSidedNum"
    @State var dieQuantityChoice = 0
    @State var rollTypeChoice = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("RollEmBlue")
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    HStack(alignment: .center, spacing: 10) {
                        Text("24")
                            .frame(width: 125, height: 125)
                            .font(.system(size: 70, weight: .black))
                            .foregroundColor(Color("RollEmBlue"))
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.white)
                            )
                        Text("2")
                            .frame(width: 124, height: 124)
                            .font(.system(size: 70, weight: .black))
                            .foregroundColor(Color("RollEmBlue"))
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(.white)
                            )
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showSettingsPopover = true
                        } ) {
                            VStack {
                                Image(systemName: "gearshape.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.top, 10)
                                Text("Settings")
                                    .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(Color("RollEmBlue"))
                            .popover(isPresented: $showSettingsPopover) {
                                VStack {
                                    Spacer()
                                    Picker("Die Type:", selection: $dieTypeChoice) {
                                        ForEach(diceAvailable, id: \.name) { die in
                                            Text(die.displayName)
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    HStack(alignment: .center) {
                                        Picker("Die Quantity", selection: $dieQuantityChoice) {
                                            Text("1 Die").tag(0)
                                            Text("2 Dice").tag(1)
                                        }
                                        .pickerStyle(.segmented)
                                        Picker("RollType", selection: $rollTypeChoice) {
                                            Text("Standard").tag(0)
                                            Text("Shuffled").tag(1)
                                        }
                                        .pickerStyle(.segmented)
                                    }
                                        .padding()
                                    Spacer()
                                    Button("Dismiss") {
                                        showSettingsPopover = false
                                    }
                                }
                                .padding()
//                                .frame(width: 200, height: 25)
                            }
                        }
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .shadow(radius: 8)
                            Circle()
                                .fill(Color("RollEmBlue"))
                                .padding(6)
                            Image(systemName: "dice.fill")
                                .resizable(resizingMode: .stretch)
                                .foregroundColor(Color.white)
                                .padding(25)
                        }
                            .frame(width: 100, height: 100)
                            .offset(x: -4, y: -geometry.size.height/8/2)
                        Spacer()
                        Button(action: {
                                showAboutPopover = true
                        } ) {
                            VStack {
                                Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.top, 10)
                                Text("About")
                                    .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(Color("RollEmBlue"))
                            .popover(isPresented: $showAboutPopover) {
                                VStack {
                                    Spacer()
                                    Text("Tap the ROLL button or shake your device to roll. STANDARD provides a traditional random roll. SHUFFLED provides each value once before repeating.")
                                        .foregroundColor(Color.black)
                                    Spacer()
                                    Button("Rate us on the App Store.") {
                                        print( { Text("Rate us button pressed.") } )
                                    }
                                    Spacer()
                                    Button("Dismiss") {
                                        showAboutPopover = false
                                    }
                                }
                                .padding()
//                                .frame(width: 200, height: 25)
                            }
                        }
                        Spacer()
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .background(Color.white.shadow(radius: 4))
                }
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
