//
//  NSWorkspace+Execute.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

extension NSWorkspace {

    static func execute(command: TerminalCommand, forProject project: Project? = nil) {
        switch command.executionMethod {
            case .inTerminal:
                executeInTerminal(command: command, project: project)
            case .justOpen:
                open(project: project, withCommand: command)
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

private extension NSWorkspace {
    static func open(project: Project?, withCommand command: TerminalCommand) {
        switch command {
            case .openWorkspace:
                guard let url = project?.workspaceURL ?? project?.projectURL else { return }
                NSWorkspace.shared.open(url)
            case .openSwiftPackage:
                guard let url = project?.swiftPackageURL else { return }
                NSWorkspace.shared.open(url)
            case .finder:
                guard let url = project?.urlPath else { return }
                NSWorkspace.shared.activateFileViewerSelecting([url])
            case .openXcodeDerivedData:
                guard let url = URL(string: directDerivedDataFolderPath) else { return }
                NSWorkspace.shared.activateFileViewerSelecting([url])
            default:
                break
        }
    }

    static func executeInTerminal(command: TerminalCommand, project: Project?) {
        guard let scriptText = command.script(for: project) else {
            return
        }
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
}
