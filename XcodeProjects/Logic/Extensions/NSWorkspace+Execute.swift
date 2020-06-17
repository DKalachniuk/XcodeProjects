//
//  NSWorkspace+Execute.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

extension NSWorkspace {

    static func execute(command: TerminalCommand, forProject project: Project) {
        let scriptText = command.scriptTextFor(project)
        let script = NSAppleScript(source: scriptText)
        var error: NSDictionary?
        script?.executeAndReturnError(&error)
        if var errorMessage = error?["NSAppleScriptErrorBriefMessage"] as? String {
            if let errorNumber = error?["NSAppleScriptErrorNumber"] as? NSNumber,
                errorNumber == NSNumber(integerLiteral: -1728) {
                errorMessage = "Please open Terminal app"
            }
            NSWorkspace.showErrorAlert(withMessage: errorMessage)
        }
    }

    static func showErrorAlert(withMessage message: String) {
        let alert = NSAlert()
        alert.messageText = "Something went wrong"
        alert.informativeText = message
        alert.alertStyle = NSAlert.Style.warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }

}
