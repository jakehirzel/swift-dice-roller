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
                        Button(action: { print("Settings Button Pressed.") } ) {
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
                            .offset(y: -geometry.size.height/8/2)
                        Spacer()
                        Button(action: { print("About Button Pressed.") } ) {
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

//Button("Roll", action: { print("Roll Button Pressed.") } )
//Picker("Die Type:", selection: $dieTypeChoice) {
//    Text("Four-Sided")
//    Text("Six-Sided")
//    Text("Eight-Sided")
//    Text("Ten-Sided")
//    Text("Twelve-Sided")
//    Text("Twenty-Sided")
//    Text("A-Z")
//}
//.pickerStyle(.wheel)
//HStack(alignment: .center) {
//    Picker("Die Quantity", selection: $dieQuantityChoice) {
//        Text("1 Die")
//        Text("2 Dice")
//    }
//    .pickerStyle(.segmented)
//    Picker("RollType", selection: $rollTypeChoice) {
//        Text("Standard")
//        Text("Shuffled")
//    }
//    .pickerStyle(.segmented)
//    Button(action: { print("Roll Button Pressed.") } ) {
//        Image(systemName: "info.circle")
//    }
//}
//    .padding()
