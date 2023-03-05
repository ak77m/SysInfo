//
//  BottomLine.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI
import AVFoundation

struct BottomLine: View {
    @EnvironmentObject var net: Manager
    
    var body: some View {
        
        HStack{
            // Exit
            Button(action: { NSApplication.shared.terminate(self) }) {
                Text("🔌") //Image(systemName: "arrow.left").opacity(0.4)  //
            }
            .help("Выход")

            Spacer()
            
            // WOL
            EntryField(sfSymbolName: "pc", placeHolder: "MAC адрес", field: $net.activeMacAddress)
                .frame(width: 180)
            
            Button(action: {
                AudioServicesPlaySystemSound(3)
                net.wake()
            }) {
                Image(systemName: "arrowtriangle.up").padding(2)  //🔚
            }

            
        }
        .buttonStyle(MyButtonStyle())
        .padding(.bottom,10)
        .padding([.leading,.trailing])
    }
}

struct BottomLine_Previews: PreviewProvider {
    static var previews: some View {
        BottomLine()
    }
}
