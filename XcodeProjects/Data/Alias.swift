//
//  Alias.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 29/06/2022.
//  Copyright © 2022 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

class Alias: Identifiable, Codable, Hashable {
    
    var id: UUID = UUID()
    var name: String

    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Alias, rhs: Alias) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
