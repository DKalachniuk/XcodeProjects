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

    private var usedColors: [NSColor] = []

    private init() {
        setupUsedColors()
    }

    private func checkIfUsedColorsEmpty() {
        if usedColors.isEmpty {
            usedColors = CodableColorPicker.allColors
        }
    }
}

extension CodableColorPicker {
    func setupUsedColors() {
        usedColors = CodableColorPicker.allColors.filter({ !UserDefaultsConfig.projectObjects.map({$0.color.color}).contains($0) })
        checkIfUsedColorsEmpty()
    }

    func pickRandomColor() -> CodableColor {
        guard let randomColor = usedColors.randomElement(),
            let randomIndex = usedColors.firstIndex(of: randomColor) else {
                print("couldn't get random color from the array")
                return CodableColor(color: NSColor.systemIndigo)
        }
        usedColors.remove(at: randomIndex)
        checkIfUsedColorsEmpty()
        return CodableColor(color: randomColor)
    }
}
