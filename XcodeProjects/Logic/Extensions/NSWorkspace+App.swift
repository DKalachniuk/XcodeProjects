//
//  NSWorkspace+App.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 01/07/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

extension NSWorkspace {
    var sourceTreeAppInstalled: Bool {
        (NSWorkspace.shared.urlForApplication(withBundleIdentifier: "com.torusknot.SourceTreeNotMAS") != nil)
    }
}
