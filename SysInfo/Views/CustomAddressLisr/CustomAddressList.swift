//
//  CustomAddressList.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct CustomAddressList: View {
    @EnvironmentObject var net: Manager
    @State var sheet = false
    
    var body: some View {
        HStack{
            Text("Доп. адреса").fontWeight(.bold)
            Spacer()
            Button("✏️") {
                sheet.toggle()
            }
            .buttonStyle(.plain)
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            
        }.padding(.horizontal)
        
        List(net.customList, id: \.self) { item in
                AddressCellView(name: item.name, ip: item.ipAddress, mac: item.mac)
        }
        .lineLimit(1)
        .lineSpacing(0)
        .frame(minHeight: 100)
        .padding(.horizontal, 5)
        
        .sheet(isPresented: $sheet) {
                NewItem(name: "Название", ip: "IP адрес", mac: "MAC адрес")
            }
    }
}

struct CustomAdressList_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddressList()
    }
}
