//
//  NewItem.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI

struct NewItem: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var net: Manager
    
    @State var name: String
    @State var ip: String
    @State var mac: String = ""
    
    var body: some View {
        VStack {
            VStack{
                EntryField(sfSymbolName: "note.text", placeHolder: "Название", field: $name)
                EntryField(sfSymbolName: "link", placeHolder: "IP адрес", field: $ip)
                EntryField(sfSymbolName: "pc", placeHolder: "MAC адрес", field: $mac)
            }
            .padding(10)
            
            HStack{
                //Exit
                Button(" Назад ") {
                    presentationMode.wrappedValue.dismiss()
                }
                //Save&exit
                Button("Сохранить") {
                    net.addNewHost(name: name, ip: ip, mac: mac)
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.vertical, 10)
            }
            
        }
        .frame(minWidth: 300, minHeight: 200)
        .padding(9)
    }
}

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem(name: "Название", ip: "IP адрес", mac: "MAC адрес")
    }
}
