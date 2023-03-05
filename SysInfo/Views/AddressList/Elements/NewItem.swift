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
    
    var body: some View {
        VStack {
            VStack{
                EntryField(sfSymbolName: "note.text", placeHolder: "Название", field: $net.activeHost.name)
                HStack{
                    Toggle(isOn: $net.activeHost.ssl) {
                        Text("HTTPS")
                    }
                    EntryField(sfSymbolName: "link", placeHolder: "IP адрес", field: $net.activeHost.ipAddress)
                }
                
                EntryField(sfSymbolName: "pc", placeHolder: "MAC адрес", field: $net.activeHost.mac)
                
                Divider()
                
                EntryField(sfSymbolName: "person", placeHolder: "User login", field: $net.activeHost.userName)
                
            }
            
            .padding(10)
            
            HStack{
                //Exit
                Button(" Назад ") {
                    presentationMode.wrappedValue.dismiss()
                }
                //Save&exit
                Button("Сохранить") {
                    // Функция добавления должна содержать проверку уникальности UID 
                    net.addNewHost()
                    presentationMode.wrappedValue.dismiss()
                }
                //.disabled(!validation.isValid)
                .padding(.vertical, 10)
            }
            
        }
        .frame(minWidth: 300, minHeight: 200)
        .padding(9)
    }
}

struct NewItem_Previews: PreviewProvider {
    static var previews: some View {
        NewItem()
    }
}
