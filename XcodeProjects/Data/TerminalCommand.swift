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

let derivedDataFolderPath = "Library/Developer/Xcode/DerivedData"
let relativeDerivedDataFolderPath = "~/\(derivedDataFolderPath)"
let directDerivedDataFolderPath = "\(FileManager.default.homeDirectoryForCurrentUser)\(derivedDataFolderPath)"

enum TerminalCommand: String {
    case podInstall = "Pod install"
    case podUpdate = "Pod update"
    case podDeintegrate = "Pod deintegrate"
    case removePodfileLock = "Remove Podfile.lock"
    case finder = "Open in Finder"
    case openInTerminal = "Open in Terminal"
    case sourceTree = "Open in Sourcetree"
    case openWorkspace = "Open Workspace"
    case clearXcodeDerivedData = "Clear Xcode derived data"
    case openXcodeDerivedData = "Open derived data in Finder "
    case clearProjectDerivedData = "Clear derived data"

    var executionMethod: ExecutionMethod {
        switch self {
            case .podUpdate, .podInstall, .openInTerminal, .sourceTree, .clearXcodeDerivedData, .clearProjectDerivedData, .podDeintegrate, .removePodfileLock:
                return .inTerminal
            case .finder, .openWorkspace, .openXcodeDerivedData:
                return .justOpen
        }
    }

    var command: String? {
        switch self {
            case .podInstall:
                return "pod install"
            case .podUpdate:
                return "pod update"
            case .podDeintegrate:
                return "pod deintegrate"
            case .openInTerminal:
                return "cd "
            case .sourceTree:
                return "open -a SourceTree"
            default:
                return nil
        }
    }

    func script(for project: Project?) -> String? {
        // script for clearXcodeDerivedData command
        if self == .clearXcodeDerivedData {
            return getScriptToRemove(file: relativeDerivedDataFolderPath)
        }

        // script for clearProjectDerivedData command
        if self == .clearProjectDerivedData {
            return getScriptToRemove(file: project?.derivedDataPath)
        }

        // script for removePodfileLock command
        if self == .removePodfileLock {
            return getScriptToRemove(file: project?.podfileLockPath)
        }

        // script for other in terminal commands
        guard let openInTerminalCommand = TerminalCommand.openInTerminal.command,
            var commandValue = command, let project = project else {
                return nil
        }
        let commandString = "\(openInTerminalCommand) \(project.path)"
        var twoLinesScript = commandString.wrappedInScript
        if self != .openInTerminal {
            twoLinesScript.append("\n")
            if self == .sourceTree {
                commandValue += " \(project.path)"
            } 
            twoLinesScript.append(commandValue.wrappedInScript)
        }
        return TerminalScript(command: twoLinesScript).script
    }

    private func getScriptToRemove(file path: String?) -> String? {
        path.map({ TerminalScript(toRemovePath: $0).script })
    }
}

extension String {
    var wrappedInScript: String {
        "do script \"\(self)\" in front window"
    }
}

