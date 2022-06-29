//
//  Alias.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 29/06/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

class Alias: Identifiable, Codable {

    var id: UUID = UUID()
    var name: String

    init(name: String) {
        self.name = name
    }
    
    static let example = [Alias(name: "la"), Alias(name: "pi")]
    
    static func test() {
        
        let path = FileManager.default.homeDirectoryForCurrentUser
        let file = ".zprofile"
        let fileURL = path.appendingPathComponent(file)
        
        do {
            let content = try String(contentsOf: fileURL, encoding: .utf8)
            print(content)
            let commands = content.split(separator: "\n").map(String.init)
            for command in commands {
                if command.contains("alias ") {
                    let aliases = command.split(separator: "=").map(String.init)
                    if let aliasName = aliases.first?.replacingOccurrences(of: "alias ", with: "") {
                        print(aliasName)
                    }
                }
            }
        }
        catch {
            
        }
        
    }
}


