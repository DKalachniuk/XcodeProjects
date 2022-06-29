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
        ProfileFile.z.aliases + ProfileFile.bash.aliases
    }()
}
