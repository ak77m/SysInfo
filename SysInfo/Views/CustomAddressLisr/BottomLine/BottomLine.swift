//
//  BottomLine.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct BottomLine: View {
    @EnvironmentObject var net: Manager

    var body: some View {
        
        HStack{
            Button(action: { NSApplication.shared.terminate(self) }) {
                Image(systemName: "power").opacity(0.4)  //🔚
            }

            Spacer()
            EntryField(sfSymbolName: "pc", placeHolder: "MAC адрес", field: $net.activeMacAddress)
                .frame(width: 180)
            
            Button(action: { net.wake()}) {
                Image(systemName: "externaldrive.connected.to.line.below")  //🔚
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
