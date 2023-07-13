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
}

class Aliases {
    static var all: [Alias] = {
        let profileFiles = UserDefaultsConfig.aliasesURLObjects.compactMap { ProfileFile.custom(name: $0.lastPathComponent, path: $0) }
        var result: [Alias] = ProfileFile.z.aliases + ProfileFile.bash.aliases
        for profileFile in profileFiles {
            result.append(contentsOf: profileFile.aliases)
        }
        return result
    }()
}
