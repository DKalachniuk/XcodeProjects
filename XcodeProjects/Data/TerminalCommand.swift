//
//  TerminalCommand.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation

enum ExecutionMethod {
    case inTerminal
    case justOpen
}

enum TerminalCommand: String {
    case podInstall = "Pod install"
    case podUpdate = "Pod update"
    case finder = "Show in Finder"
    case openInTerminal = "Open in Terminal"
    case sourceTree = "Open in Sourcetree"
    case openWorkspace = "Open Workspace"
    case clearXcodeDerivedData = "Clear Xcode derived data"

    var executionMethod: ExecutionMethod {
        switch self {
            case .podUpdate, .podInstall, .openInTerminal, .sourceTree, .clearXcodeDerivedData:
                return .inTerminal
            case .finder, .openWorkspace:
                return .justOpen
        }
    }

    var command: String? {
        switch self {
            case .podInstall:
                return "pod install"
            case .podUpdate:
                return "pod update"
            case .openInTerminal:
                return "cd "
            case .sourceTree:
                return "open -a SourceTree"
            case .clearXcodeDerivedData:
                return "rm -rf ~/Library/Developer/Xcode/DerivedData"
            default:
                return nil
        }
    }

    func script(for project: Project) -> String? {
        guard let openInTerminalCommand = TerminalCommand.openInTerminal.command,
            var commandValue = command else {
                return nil
        }
        let commandString = "\(openInTerminalCommand) \(project.path)"
        var twoLinesScript = commandString.wrapedInScript
        if self != .openInTerminal {
            twoLinesScript.append("\n")
            if self == .sourceTree {
                commandValue += " \(project.path)"
            } 
            twoLinesScript.append(commandValue.wrapedInScript)
        }
        let terminalScript = TerminalScript(command: twoLinesScript)
        return terminalScript.script
    }
}

private extension String {
    var wrapedInScript: String {
        "do script \"\(self)\" in front window"
    }
}

