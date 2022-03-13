//
//  Manager.swift
//  SysInfo
//
//  Created by ak77m on 12.03.2022.
//

import Foundation

final class Manager: ObservableObject {

    @Published var ipAddressList: [Host] = []
    @Published var customList: [Host] = []
    
    func getIpPool () {
        Interfaces.request.getInterfaces()
        ipAddressList = Interfaces.request.ipAdressList
        
    }
    
    
//    let id: UUID = UUID()
//    let name: String?
//    let ipAddress: String?
//    let mac: String?
//    let ver: String?
    
    
    func addNewHost(name: String, ip: String, mac : String) {
        customList.append(Host(name: name, ipAddress: ip, mac: mac, ver: ""))
        //saveDefaults()
//        ip = ""
//        link = ""
//        loginName = ""
//        password = ""
    }
    
}
