//
//  CopyAndOpenView.swift
//  SysInfo
//
//  Created by ak77m on 07.09.2022.
//

import SwiftUI

struct CopyAndOpenView: View {
    let data: String
    
    var body: some View {
        HStack{
            Button {
                copyToClipboard()
            } label: {
                Image(systemName: "doc.on.doc")
            }.help("Скопировать адрес")
            
            Button {
                openUrlInBrowser()
            } label: {
                Image(systemName: "link")
            }.help("Открыть в браузере")
            
        }
        .buttonStyle(.plain)
    }
    
    private func copyToClipboard() {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(data,forType: .string)
    }
    
    private func openUrlInBrowser() {
        //if let url = URL(string: "http://\(data)") {
        if let url = URL(string: data) {
            NSWorkspace.shared.open(url)
        }
    }
}

struct CopyAndOpenView_Previews: PreviewProvider {
    static var previews: some View {
        CopyAndOpenView(data: "IP address")
    }
}
