//
//  Host.swift
//  GetPostRequests
//
//  Created by ak77m on 24.10.2021.
//

import Foundation

// MARK: - Simple struct for array of IP adresses
struct Host : Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    var name: String = ""
    var ipAddress: String = ""
    var mac: String = ""
    var status: String?
    var ver: String = ""
    var ssl: Bool = false
    var userName: String = ""
}
