//
//  AddressList.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct AddressList: View {
    let ipVersion: String
    @EnvironmentObject var net: Manager
    
    var body: some View {
        HStack{
            Text("Локальные адреса").fontWeight(.bold)
            Spacer()
            Button("💫") {
                net.getIpPool()
            }
            .buttonStyle(.plain)
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            
        }.padding(.horizontal)
        
        List(net.ipAddressList, id: \.self) { line in
            if line.ver == ipVersion.replacingOccurrences(of: " ", with: "") {
                AddressCellView(name: line.name, ip: line.ipAddress, mac: line.mac)
            }
        }
        .lineLimit(1)
        .lineSpacing(0)
        .frame(minHeight: 100)
        .padding(.horizontal, 5)
    }
}


struct AddressList_Previews: PreviewProvider {
    static var previews: some View {
        AddressList(ipVersion: "")
    }
}
