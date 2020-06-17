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
}
