//
//  Project.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation
import AppKit

struct Project: Identifiable, Codable {

    let id: UUID = UUID()
    let name: String
    let path: String
    let color: CodableColor

    init(name: String, path: String) {
        self.name = name
        self.path = path
        self.color = CodableColor(color: [NSColor.orange, NSColor.blue, NSColor.yellow, NSColor.red, NSColor.green].randomElement()!)
    }

    init?(url: URL) {
        guard let name = url.path.lastComponent else {
            return nil
        }
        let splitName = name.split(separator: "-").last ?? name
        self.init(name: String(splitName), path: url.path)
    }
}

extension Project {

    var urlPath: URL? {
        URL(fileURLWithPath: path)
    }

    var workspaceURL: URL? {
        FileManager.default.getWorkspaceFrom(project: self)
    }

    var projectURL: URL? {
        FileManager.default.getXcodeProjFrom(project: self)
    }

    var hasXcodeProject: Bool {
        (workspaceURL ?? projectURL) != nil
    }
}

extension Project {

    var hasCocoapods: Bool {
        FileManager.default.getPodfile(project: self) != nil
    }
}

extension Project {
    static let dummy = Project(name: "DummyProject", path: "/AnyPath")
}
