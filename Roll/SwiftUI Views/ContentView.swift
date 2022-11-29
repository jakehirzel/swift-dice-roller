//
//  ContentView.swift
//  Roll
//
//  Created by Jake Hirzel on 11/29/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Text("Die 1")
                Text("Die 2")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
