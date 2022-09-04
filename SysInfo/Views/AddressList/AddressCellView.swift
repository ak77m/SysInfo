//
//  AddressCellView.swift
//  SysInfo
//
//  Created by ak77m on 12.03.2022.
//

import SwiftUI

// Стиль строки отображения адресов
struct AddressCellView: View {
    @StateObject private var urlChecker = CheckURL()
    
    let name: String?
     let ip: String?
     let mac: String?
    
    var body: some View {
        HStack(spacing: 5.0){
            // address status TODO
            //🟢🔴⚫️⚪️
            Text("⚫️ ").onTapGesture {
             print("Address is \(ip ?? "")")
                //let n = HostStatus.hostStatus.getStatus(ipAddress: ip ?? "")
                //print (n)
                urlChecker.verifyURL(urlPath: "http://\(ip ?? "")/")
                print("Reachable? \(urlChecker.urlReachable.rawValue)")
            }
            
            VStack(alignment: .leading){
                Text("\(name ?? "")").fontWeight(.bold)
                Text("\(ip ?? "")").font(.caption).opacity(0.8)
               // Text("\(mac?.uppercased() ?? "" )").font(.caption).opacity(0.6)
                
            }
            Spacer()
            
            HStack{
                // Copy text to clipboard
                Button("📂")  {
                    guard let textToCopy = ip else {return}
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(textToCopy,forType: .string)
                }
                // open address in the browser
                Button("🔗")  { //🌎
                    guard let ip = ip else {return}
                    if let url = URL(string: "http://\(ip)") {
                        NSWorkspace.shared.open(url)
                    }
                }            }
            .buttonStyle(.plain)
        }
        .contentShape(Rectangle())
    }
}

struct AddressCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddressCellView(name: "Имя", ip: "IP address", mac: "MAC Address")
    }
}
