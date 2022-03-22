//
//  AddressList.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI
import AVFoundation

struct AddressList: View {
    let ipVersion: String
    @EnvironmentObject var net: Manager
    
    var body: some View {
        HStack{
            Text("Локальные адреса").fontWeight(.bold)
            Spacer()
            Button(action: {
                AudioServicesPlaySystemSound(3)
                net.getIpPool()
            }) {
                Image(systemName: "magnifyingglass")
            }
            .buttonStyle(MyButtonStyle())
            
        }.padding(.horizontal)
        
        List(net.ipAddressList, id: \.self) { line in
            if line.ver == ipVersion.replacingOccurrences(of: " ", with: "") {
                AddressCellView(name: line.name, ip: line.ipAddress, mac: line.mac)
            }
        }
        
       
        .lineLimit(1)
        .lineSpacing(0)
        .frame(minHeight: 50, idealHeight: 60)
        .padding(.horizontal, 5)
        
    }
}


struct AddressList_Previews: PreviewProvider {
    static var previews: some View {
        AddressList(ipVersion: "")
    }
}
