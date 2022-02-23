//
//  CustomCommand.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 23/02/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

class CustomCommand: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    
    let name: String
    let command: String
    
    init (name: String? = nil, command: String) {
        var newName = name ?? command
        if newName.isEmpty {
            newName = command
        }
        self.name = newName
        self.command = command
    }
    
    func fullCommand(for project: Project) -> String {
        "cd \(project.path);\(command)"
    }
    
    static func == (lhs: CustomCommand, rhs: CustomCommand) -> Bool {
        lhs.command == rhs.command
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name);
        hasher.combine(command)
    }
}
