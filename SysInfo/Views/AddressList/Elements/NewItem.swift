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
                EntryField(sfSymbolName: "link", placeHolder: "IP адрес", field: $net.activeHost.ipAddress)
                EntryField(sfSymbolName: "pc", placeHolder: "MAC адрес", field: $net.activeHost.mac)
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
