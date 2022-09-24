//
//  CustomAddressList.swift
//  SysInfo
//
//  Created by ak77m on 13.03.2022.
//

import SwiftUI
import AVFoundation

struct CustomAddressList: View {
    @EnvironmentObject var net: Manager
    @State private var sheetIsPresented = false
    //@StateObject private var urlChecker = CheckURL()
    
    var body: some View {
        HStack{
            Text("Доп. адреса").fontWeight(.bold)
            Spacer()
            
            Button {
                AudioServicesPlaySystemSound(3)
                net.activeHost = Host()
                sheetIsPresented.toggle()
                
            } label: {
                Image(systemName: "plus")
            }
            .help("Новый адрес")
            .buttonStyle(MyButtonStyle())
            
        }.padding(.horizontal)
        
        List{
            ForEach(net.customList, id: \.id) { item in
                AddressCellView(host: item) 
                    .onTapGesture {
                        net.activeMacAddress = item.mac
                    }
                
                    .contextMenu{
                       ContextMenuView(sheetIsPresented: $sheetIsPresented, item: item)
                    }
            }
            
        }
        .lineSpacing(0)
        .frame(minHeight: 100)
        .padding(.horizontal, 5)
        
        .sheet(isPresented: $sheetIsPresented) {
            //New record or edit
            NewItem()
        }
    }
    
    
}

struct CustomAdressList_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddressList()
    }
}
