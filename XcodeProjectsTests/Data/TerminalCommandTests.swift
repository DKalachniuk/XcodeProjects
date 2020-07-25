//
//  TerminalScriptTests.swift
//  XcodeProjectsTests
//
//  Created by Dima Kalachniuk on 22/06/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import XCTest
@testable import XcodeProjects

class TerminalScriptTests: XCTestCase {

    func testTerminalCommand_Script_ReturnsCorrectScriptValue() {
        let podInstallScript = """
        tell application "Terminal"
        if not (exists window 1) then reopen
        activate
        pod install
        end tell
        """
        let terminalCommand = TerminalScript(command: "pod install")
        XCTAssertEqual(podInstallScript, terminalCommand.script)
    }

}
