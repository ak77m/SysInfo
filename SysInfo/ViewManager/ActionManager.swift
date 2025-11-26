//
//  ActionManager.swift
//  SysInfo
//
//  Created by ak77m on 05.03.2023.
//

import SwiftUI

final class ActionManager: ObservableObject {
    
    
    func copyToClipboard(_ data: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(data,forType: .string)
    }
    
    func openUrlInSsh(_ data: String, _ name: String) {
        NSPasteboard.general.clearContents()
        let stringText = "ssh \(name)@\(data)"
        NSPasteboard.general.setString(stringText,forType: .string)
    }
    
    func openUrlInBrowser(_ data: String, _ https: Bool) {
        //if let url = URL(string: "http://\(data)") {
        if https {
            let hostUrl = URL(string: "https://\(data)")
            NSWorkspace.shared.open(hostUrl!)
        } else {
            let hostUrl = URL(string: "http://\(data)")
            NSWorkspace.shared.open(hostUrl!)
        }
        
    }
   
    
}
