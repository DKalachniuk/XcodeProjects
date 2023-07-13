//
//  ProfileFile.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 29/06/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

enum ProfileFile {
    case z
    case bash
    case custom(name: String, path: URL)
}

extension ProfileFile {
    var fileURL: URL {
        switch self {
        case .z, .bash: return parentURL.appendingPathComponent(fileName) // we need to add name of the file
        case .custom: return parentURL // name of the file is already in the parent path
        }
    }
    
    var aliases: [Alias] {
        let aliasString = "alias "
        var aliasesArray: [Alias] = []
        let commands = content?.split(separator: "\n").map(String.init)
        for command in commands ?? [] where command.contains(aliasString) {
            let aliases = command.split(separator: "=").map(String.init)
            if let aliasName = aliases.first?.replacingOccurrences(of: aliasString, with: "") {
                aliasesArray.append(Alias(name: aliasName))
            }
        }
        return aliasesArray
    }
}

fileprivate extension ProfileFile {
     var fileName: String {
        switch self {
        case .z: return ".zprofile"
        case .bash: return ".bash_profile"
        case .custom(let name, _): return name
        }
    }
    
    var parentURL: URL {
        switch self {
        case .z, .bash: return FileManager.default.homeDirectoryForCurrentUser
        case .custom(_, let path): return path
        }
    }
    
    var content: String? {
        do {
            return try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

extension ProfileFile: Equatable {
    static func ==(lhs: ProfileFile, rhs: ProfileFile) -> Bool {
        switch (lhs, rhs) {
            case (.z, .z), (.bash, .bash):
                return true
            case (.custom(let lhsName, let lhsURL), .custom(let rhsName, let rhsURL)):
                return lhsName == rhsName && lhsURL == rhsURL
            default:
                return false
        }
    }
}
