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
            Button(action: { NSApplication.shared.terminate(self) }) {
                Image(systemName: "power").opacity(0.4)  //๐
            }

            Spacer()
            EntryField(sfSymbolName: "pc", placeHolder: "MAC ะฐะดัะตั", field: $net.activeMacAddress)
                .frame(width: 180)
            
            Button(action: {
                AudioServicesPlaySystemSound(3)
                net.wake()
            }) {
                
                Image(systemName: "externaldrive.connected.to.line.below")  //๐
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
