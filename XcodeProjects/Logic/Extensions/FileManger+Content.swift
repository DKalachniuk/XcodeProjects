//
//  FileManger+Content.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 20/06/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import Foundation

extension FileManager {

    func contentsOfProject(_ project: Project) -> [URL]? {
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
}
