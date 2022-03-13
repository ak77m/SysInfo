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
   // @State var items
    
    var body: some View {
        HStack{
            Text("Доп. адреса").fontWeight(.bold)
            Spacer()
            
            Button(action: { sheet.toggle() }) {
                Image(systemName: "plus")
            }
            .buttonStyle(MyButtonStyle())
            
        }.padding(.horizontal)
        
        List{
            ForEach(net.customList, id: \.id) { item in
                AddressCellView(name: item.name, ip: item.ipAddress, mac: item.mac)
                    .onTapGesture {
                        net.activeMacAddress = item.mac ?? "00:00:00:00:00:00"
                    }
            }
            .onDelete(perform: delete)
            
            
        }
//        .lineLimit(1)
        .lineSpacing(0)
        .frame(minHeight: 100)
        .padding(.horizontal, 5)
        
        .sheet(isPresented: $sheet) {
            NewItem(name: "", ip: "", mac: "")
        }
    }
    
        private func delete(at indexSet: IndexSet) {
            indexSet.forEach { net.customList.remove(at: $0) }
            net.saveCustomList()
        }
    
}

struct CustomAdressList_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddressList()
    }
}
