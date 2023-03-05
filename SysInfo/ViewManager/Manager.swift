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
    @Published var activeHost: Host = Host() // текущий адрес для редактирования или новый адрес
    @Published var activeMacAddress = ""
    
    var wol = Wol()
    var interfaces = Interfaces()
    var storage = ConfigurationStorage()
   // var hostStatus: HostStatus

    init() {
        customList = storage.loadConfiguration()
    }
    
    func wake() {
        _ = wol.toTarget(MAC: activeMacAddress)
        print(activeMacAddress)
    }
    
    func getIpPool () {
        interfaces.getInterfaces()
        ipAddressList = interfaces.ipAddressList
    }
    
    func addNewHost() {

        var isNewItem = true
       
        customList.indices.forEach {
            if customList[$0].id == activeHost.id {
                customList[$0] = activeHost
                isNewItem = false
            }
        }

        if isNewItem {
            customList.append(activeHost)
        }
        storage.saveConfiguration(customList)
    }
    
    func deleteHost(_ index: Host) {
        let records = customList.filter{ $0 != index }
        customList = records
        storage.saveConfiguration(customList)
    }
    
    
    
    
   
}

