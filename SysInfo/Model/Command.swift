//
//  Command.swift
//  SysInfo
//
//  Created by ak77m on 12.09.2022.
//

import Foundation

// MARK: - Struct for all custom API requests
struct Command {
    var commandString : String
    var parameters = [String: Any]()
    var comment : String?
}
