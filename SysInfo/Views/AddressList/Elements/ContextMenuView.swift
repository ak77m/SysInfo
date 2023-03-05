//
//  ContextMenuView.swift
//  SysInfo
//
//  Created by ak77m on 12.09.2022.
//

import SwiftUI

struct ContextMenuView: View {
   
    @EnvironmentObject var net: Manager
    @Binding var sheetIsPresented : Bool
    let item : Host
    
    var body: some View {
        
         Button("Редактировать  🖊️", action: {
             net.activeHost = item
             sheetIsPresented.toggle()
         })
         
        Button("Удалить             🗑", action: {
             net.deleteHost(item)
         })
        
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
       
        ContextMenuView(sheetIsPresented: .constant(false), item: Host(id: UUID(), name: "Test", ipAddress: "127.0.0.1", mac: "00:00:00:00:00:00", status: ""))
    }
}
