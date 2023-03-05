//
//  AddressList.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI
import Foundation
//import AVFoundation



struct AddressList: View {
    let ipVersion: String
    @State var ipV6: Bool = false
    @EnvironmentObject var net: Manager
    
    var body: some View {
        HStack{
            Toggle(isOn: $ipV6) {
                Text("+ IPv6")
            }
            Text("Локальные интерфейсы").fontWeight(.bold)
            Spacer()
            Button(action: {
                net.getIpPool()
            }) {
                Image(systemName: "goforward")
            }
            .buttonStyle(MyButtonStyle())
            
        }.padding(.horizontal)
        
        List(net.ipAddressList, id: \.self) { line in
            
            if !ipV6 {
                if line.ver == ipVersion.replacingOccurrences(of: " ", with: "") {
                    AddressCellView(host: line, browser: false)
                }
            } else {
                    AddressCellView(host: line, browser: false)
            }
        }
        .onAppear(perform: fetch)
        .lineLimit(1)
        .lineSpacing(0)
        //.frame(minHeight: 50, idealHeight: 60)
        .padding(.horizontal, 5)
        
    }
    
    private func fetch() {
        net.getIpPool()
    }
    
}


struct AddressList_Previews: PreviewProvider {
    static var previews: some View {
        AddressList(ipVersion: "")
    }
}
