//
//  TerminalCommand.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

enum TerminalCommand: String {
    case podInstall = "Pod install"
    case podUpdate = "Pod update"
    case finder = "Show in Finder"
    case open = "Open in Terminal"
    case sourceTree = "Open in Sourcetree"
    case openWorkspace = "Open Workspace"

    var command: String {
        switch self {
        case .podInstall:
            return "pod install"
        case .podUpdate:
            return "pod update"
        case .open:
            return "cd "
        case .finder:
            return "open ."
        case .sourceTree:
            return "open -a SourceTree"
        case .openWorkspace:
            return "open "
        }
    }

    func scriptTextFor(_ project: Project) -> String {
        let commandString = "\(TerminalCommand.open.command) \(project.path)"
        var twoLines = commandString.doScript
        if self != .open {
            twoLines.append("\n")
            var commandValue = command
            if self == .sourceTree {
                commandValue += " \(project.path)"
            } else if self == .openWorkspace {
                commandValue += project.workspaceURL?.absoluteString ?? project.projectURL?.absoluteString ?? ""
            }
            twoLines.append(commandValue.doScript)
        }
        let scriptText = """
        tell application "Terminal"
        if not (exists window 1) then reopen
        activate
        \(twoLines)
        end tell
        """
        return scriptText
    }
}

private extension String {
    var doScript: String {
        "do script \"\(self)\" in front window"
    }
}

