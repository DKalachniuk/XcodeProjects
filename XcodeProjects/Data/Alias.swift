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
    
    static let example = [Alias(name: "la"), Alias(name: "pi")]
    
    static func test() {
        
        let path = FileManager.default.homeDirectoryForCurrentUser
        let file = ".zprofile"
        let fileURL = path.appendingPathComponent(file)
        
        //reading
        do {
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            print(text)
        }
        catch {/* error handling here */}
        
    }
}


