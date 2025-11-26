//
//  ConfigurationStoradge.swift
//  SysInfo
//
//  Created by ak77m on 10.09.2022.
//

import Foundation

final class ConfigurationStorage {
    
    func saveConfiguration(_ customList: [Host]) {
        let pathDirectory = getDocumentsDirectory()
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        let filePath = pathDirectory.appendingPathComponent("saveCustomList.json")
        
        let json = try? JSONEncoder().encode(customList)
        
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
    
    func loadConfiguration() -> [Host] {
        var result = [Host]()
        let pathDirectory = getDocumentsDirectory()
        do {
            let filePath = pathDirectory.appendingPathComponent("saveCustomList.json")
            let data = try Data(contentsOf: filePath, options: .mappedIfSafe)
            
            let decodedData = try JSONDecoder().decode([Host].self, from: data)
            //DispatchQueue.main.async {
            result = decodedData
            //self.customList = decodedData
           // }
            
        } catch {
        }
        
        return result
    }
    
    
}
