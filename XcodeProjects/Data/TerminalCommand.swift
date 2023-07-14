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

enum TerminalCommand {
    case podInstall
    case podUpdate
    case podDeintegrate
    case removePodfileLock
    case finder
    case openInTerminal
    case sourceTree
    case fork
    case openWorkspace
    case openSwiftPackage
    case clearXcodeDerivedData
    case openXcodeDerivedData
    case clearProjectDerivedData
    case custom(command: String)
    case alias(command: String)

    var title: String {
        switch self {
            case .podInstall: return "Pod install"
            case .podUpdate: return "Pod update"
            case .podDeintegrate: return "Pod deintegrate"
            case .removePodfileLock: return "Remove Podfile.lock"
            case .finder: return "Open in Finder"
            case .openInTerminal: return "Open in Terminal"
            case .sourceTree: return "Open in Sourcetree"
            case .fork: return "Open in Fork"
            case .openWorkspace: return "Open Workspace"
            case .openSwiftPackage: return "Open Package.swift"
            case .clearXcodeDerivedData: return "Clear Xcode derived data"
            case .openXcodeDerivedData: return "Open derived data in Finder "
            case .clearProjectDerivedData: return "Clear derived data"
            case .custom(let command): return command
            case .alias(let command): return command
        }
    }

    var executionMethod: ExecutionMethod {
        switch self {
        case .podUpdate, .podInstall, .openInTerminal, .sourceTree, .fork, .clearXcodeDerivedData, .clearProjectDerivedData, .podDeintegrate, .removePodfileLock, .custom, .alias:
                return .inTerminal
            case .finder, .openWorkspace, .openXcodeDerivedData, .openSwiftPackage:
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
            case .fork:
                return "open -a Fork"
            case .custom(let command):
                return command
            case .alias(let command):
                return command
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
        
        // script for aliases
        if let command = command, self == .alias(command: command) {
            return TerminalScript(command: (command.wrappedInScript)).script
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
            if self == .sourceTree || self == .fork {
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

extension TerminalCommand: Equatable {
    static func ==(lhs: TerminalCommand, rhs: TerminalCommand) -> Bool {
        switch (lhs, rhs) {
        case (.podInstall, .podInstall), (.podUpdate, .podUpdate), (.podDeintegrate, .podDeintegrate), (.removePodfileLock, .removePodfileLock), (.finder, .finder), (.openInTerminal, .openInTerminal), (.sourceTree, .sourceTree), (.fork, .fork), (.openWorkspace, .openWorkspace), (.openSwiftPackage, .openSwiftPackage), (.clearXcodeDerivedData, .clearXcodeDerivedData), (.openXcodeDerivedData, .openXcodeDerivedData), (.clearProjectDerivedData, .clearProjectDerivedData):
                return true
            case (.custom(let lhsCommand), .custom(let rhsCommand)):
                return lhsCommand == rhsCommand
            case (.alias(let lhsCommand), .alias(let rhsCommand)):
                return lhsCommand == rhsCommand
            default:
                return false
        }
    }
}

extension String {
    var wrappedInScript: String {
        "do script \"\(self)\" in front window"
    }
}
