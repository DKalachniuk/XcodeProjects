//
//  FileManger+Content.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 20/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

extension FileManager {

    func getWorkspaceFrom(project: Project) -> URL? {
        filter(urls: contentsOf(project: project), by: "xcworkspace")?.first
    }

    func getXcodeProjFrom(project: Project) -> URL? {
        filter(urls: contentsOf(project: project), by: "xcodeproj")?.first
    }

    func getPodfile(project: Project) -> URL? {
        filter(urls: contentsOf(project: project), byName: "Podfile")?.first
    }
}

private extension FileManager {
    func contentsOf(project: Project) -> [URL]? {
        guard let urlPath = project.urlPath else {
            return nil
        }
        do {
            let fileURLs = try contentsOfDirectory(at: urlPath, includingPropertiesForKeys: nil)
            return fileURLs
        } catch {
            print("Error while enumerating files \(urlPath): \(error.localizedDescription)")
            return nil
        }
    }

    func filter(urls: [URL]?, by pathExtension: String) -> [URL]? {
        urls?.filter({ $0.pathExtension == pathExtension })
    }

    func filter(urls: [URL]?, byName name: String) -> [URL]? {
        urls?.filter({ $0.lastPathComponent == name })
    }
}
