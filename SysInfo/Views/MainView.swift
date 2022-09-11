//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import SwiftUI
import AppKit

struct MainView: View {
    var body: some View {
        VStack(alignment: .leading) {
            AddressList(ipVersion: "IP v4")
            CustomAddressList()
            BottomLine()
        }
        .padding(.top, 10)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
