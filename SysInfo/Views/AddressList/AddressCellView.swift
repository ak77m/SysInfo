//
//  AddressCellView.swift
//  SysInfo
//
//  Created by ak77m on 12.03.2022.
//

import SwiftUI

struct AddressCellView: View {

    let name: String?
     let ip: String?
     let mac: String?
    
    var body: some View {
        HStack(spacing: 5.0){
            VStack(alignment: .leading){
                Text("\(name ?? "") \(ip ?? "")").fontWeight(.bold)
                Text("\(mac?.uppercased() ?? "" )")
                    .font(.caption).opacity(0.6)
            }
            Spacer()
            
            HStack{
                Button("📂")  {
                    guard let textToCopy = ip else {return}
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(textToCopy,forType: .string)
                }
                Button("🔗")  { //🌎
                    guard let ip = ip else {return}
                    if let url = URL(string: "http://\(ip)") {
                        NSWorkspace.shared.open(url)
                    }
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct AddressCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddressCellView(name: "Имя", ip: "IP address", mac: "MAC Address")
    }
}
