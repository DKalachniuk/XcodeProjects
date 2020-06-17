//
//  Project.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

struct Project: Identifiable, Codable {

    let id: UUID = UUID()
    let name: String
    let path: String

    init(name: String, path: String) {
        self.name = name
        self.path = path
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
        URL(string: path)
    }

    var workspaceURL: URL? {
        urlPath?.appendingPathComponent(name + ".xcworkspace")
    }

    var projectURL: URL? {
        urlPath?.appendingPathComponent(name + ".xcodeproj")
    }
}

extension Project {
    static let dummy = Project(name: "DummyProject", path: "/AnyPath")
}
