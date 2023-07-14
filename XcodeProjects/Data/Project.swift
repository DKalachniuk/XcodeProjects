//
//  Project.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation
import AppKit

class Project: Identifiable, Codable {

    var id: UUID = UUID()
    var name: String
    let path: String
    var color: CodableColor
    var iconPath: String?

    init(name: String, path: String) {
        self.name = name
        self.path = path
        self.color = CodableColorPicker.shared.pickRandomColor()
    }

    convenience init?(url: URL) {
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
        FileManager.default.getWorkspaceFrom(for: self)
    }
    
    var swiftPackageURL: URL? {
        FileManager.default.getSwiftPackageFrom(for: self)
    }

    var projectURL: URL? {
        FileManager.default.getXcodeProjFrom(for: self)
    }

    var podfileLockPath: String? {
        FileManager.default.getPodfileLockFrom(for: self)?.absoluteString.removeFilePath
    }

    var hasPodfileLock: Bool {
        podfileLockPath != nil
    }

    var derivedDataPath: String? {
        FileManager.default.getXcodeDerivedData(for: self)?.absoluteString.removeFilePath
    }

    var hasDerivedData: Bool {
        derivedDataPath != nil
    }

    var hasXcodeProject: Bool {
        (workspaceURL ?? projectURL) != nil
    }
    
    var hasSwiftPackage: Bool {
        swiftPackageURL != nil
    }
}

extension Project {

    var hasCocoapods: Bool {
        FileManager.default.getPodfile(for: self) != nil
    }
}

extension Project {
    static let dummy = Project(name: "DummyProject", path: "/AnyPath")
}
