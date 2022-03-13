//
//  Host.swift
//  GetPostRequests
//
//  Created by ak77m on 24.10.2021.
//

import Foundation

// MARK: - Simple struct for array of local IP adresses
struct Host : Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    let name: String?
    let ipAddress: String?
    let mac: String?
    let ver: String?
    
}
