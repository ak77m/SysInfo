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
                        Button("Редактировать", action: {
                            net.activeHost = item
                            sheetIsPresented.toggle()
                        })
                        Button("Удалить", action: {
                            net.deleteHost(item)
                        })
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
    
//    private func ipStatus(_ ip: String) -> String {
//        urlChecker.verifyURL(urlPath: "http://\(ip)/")
//        if urlChecker.urlReachable == .reachable {
//            return "🟢" }
//        else {
//            print("\(ip) ------")
//            return "⚫️" }
//        //                print("Reachable? \(urlChecker.urlReachable.rawValue)")
//    }
    
  
    
}

struct CustomAdressList_Previews: PreviewProvider {
    static var previews: some View {
        CustomAddressList()
    }
}
