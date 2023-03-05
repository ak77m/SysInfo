//
//  CopyAndOpenView.swift
//  SysInfo
//
//  Created by ak77m on 07.09.2022.
//

import SwiftUI

struct CopyAndOpenView: View {
    @StateObject var actionManager = ActionManager()
    let activeHost: Host
    let browser: Bool
    
    var body: some View {
        HStack{
            
            Button {
                actionManager.copyToClipboard(activeHost.ipAddress)           // To ToClipboard
            } label: {
                Image(systemName: "doc.on.doc")
            }.help("Скопировать адрес")
            
            if browser {
                
                Button {
                    actionManager.openUrlInSsh()               // in Terminal
                } label: {
                    Image(systemName: "terminal")
                }.help("Открыть в терминале")
                
                Button {
                    actionManager.openUrlInBrowser(activeHost.ipAddress, activeHost.ssl) // In Browser
                } label: {
                    Image(systemName: "link")
                }.help("Открыть в браузере")
                
            }
        }
        .buttonStyle(.plain)
    }
    
 
}

