//
//  CodableColorPicker.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 25/07/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import AppKit

class CodableColorPicker {

    static let shared = CodableColorPicker()

    private static let allColors = [NSColor.systemRed,
                                    NSColor.systemGreen,
                                    NSColor.systemBlue,
                                    NSColor.systemIndigo,
                                    NSColor.systemOrange,
                                    NSColor.systemPurple]
    private var usedColors = CodableColorPicker.allColors

    private init() {}
    
    func pickRandomColor() -> CodableColor {
        guard let randomColor = usedColors.randomElement(),
            let randomIndex = usedColors.firstIndex(of: randomColor) else {
                fatalError("couldn't get random color from the array")
        }
        usedColors.remove(at: randomIndex)
        if usedColors.isEmpty {
            usedColors = CodableColorPicker.allColors
        }
        return CodableColor(color: randomColor)
    }
}
