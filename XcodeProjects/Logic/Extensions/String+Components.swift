//
//  String+Components.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 17/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

extension String {
    var lastComponent: Substring? {
        split(separator: "/").last
    }

    var removeFilePath: String? {
        replacingOccurrences(of: "file://", with: "")
    }
}
