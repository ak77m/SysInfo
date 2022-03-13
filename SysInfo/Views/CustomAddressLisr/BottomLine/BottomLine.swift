//
//  BottomLine.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct BottomLine: View {
    @State var wolMacAddress: String = ""
    var body: some View {
        HStack{
            Button("🔚") {
                NSApplication.shared.terminate(self)
            }
            .font(.title)
            
            
            Spacer()
            
            TextField("MAC address", text: $wolMacAddress)
                .frame(width: 150)
            
            Button("📣") {   }
            .buttonStyle(.plain)
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            
        }
        
        .buttonStyle(.plain)
        .padding(.bottom,10)
        .padding([.leading,.trailing])
    }
}

struct BottomLine_Previews: PreviewProvider {
    static var previews: some View {
        BottomLine()
    }
}
