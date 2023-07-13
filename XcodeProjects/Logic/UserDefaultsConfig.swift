//
//  UserDefaultsConfig.swift
//  Tim
//
//  Created by Dima Kalachniuk on 17/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

struct UserDefaultsConfig {
    @UserDefault("projects", defaultValue: nil)
    static var projects: Data?

    @UserDefault("hintDisabled", defaultValue: false)
    static var hintDisabled: Bool

    @UserDefault("showProjectIcon", defaultValue: true)
    static var showProjectIcon: Bool

    @UserDefault("customTerminalCommands", defaultValue: nil)
    static var customTerminalCommands: Data?
    
    @UserDefault("aliasesURLs", defaultValue: nil)
    static var aliasesURLsData: Data?
}

extension UserDefaultsConfig {
    static var projectObjects: [Project] {
        if let projectsData = UserDefaultsConfig.projects {
            do {
                return try JSONDecoder().decode([Project].self, from: projectsData)
            } catch { }
        }
        return []
    }
    
    static var customTerminalCommandObjects: [CustomCommand] {
        if let commandsData = UserDefaultsConfig.customTerminalCommands {
            do {
                return try JSONDecoder().decode([CustomCommand].self, from: commandsData)
            } catch { }
        }
        return []
    }
    
    static var aliasesURLObjects: [URL] {
        if let urls = UserDefaultsConfig.aliasesURLsData {
            do {
                return try JSONDecoder().decode([URL].self, from: urls)
            } catch { }
        }
        return []
    }
}
