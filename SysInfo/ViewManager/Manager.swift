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
    @Published var activeMacAddress = "" 
    
    var wol : Wol
    var hostStatus: HostStatus

    init() {
        wol = Wol()
        hostStatus = HostStatus()
        loadCustomList()
    }
    
    func wake() {
        _ = wol.toTarget(MAC: activeMacAddress)
        print(activeMacAddress)
    }
    
    func getIpPool () {
        Interfaces.request.getInterfaces()
        ipAddressList = Interfaces.request.ipAdressList
        
    }
    
    func addNewHost(name: String, ip: String, mac : String) {
        customList.append(Host(name: name, ipAddress: ip, mac: mac, ver: ""))
        saveCustomList()
        
    }
    
    func saveCustomList() {
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("saveCustomList.json")
        
        let array = customList
        let json = try? JSONEncoder().encode(array)
        
        do {
            try json!.write(to: filePath)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func loadCustomList() {
        let pathDirectory = getDocumentsDirectory()
        do {
            let filePath = pathDirectory.appendingPathComponent("saveCustomList.json")
            let data = try Data(contentsOf: filePath, options: .mappedIfSafe)
            
            let decodedData = try JSONDecoder().decode([Host].self, from: data)
            //DispatchQueue.main.async {
                self.customList = decodedData
           // }
            
        } catch {
        }
    }
    
    
   
}

