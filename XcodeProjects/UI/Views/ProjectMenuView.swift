//
//  ProjectMenuView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectMenuView: View {

    let project: Project
    @EnvironmentObject var preferences: Preferences
    @State private var hover = false

    var body: some View {
        MenuButton(label: ActionsMenuText()) {
            TerminalCommandButton(project: project, command: .openInTerminal)
            TerminalCommandButton(project: project, command: .finder)

            if NSWorkspace.shared.sourceTreeAppInstalled {
                TerminalCommandButton(project: project, command: .sourceTree)
            }

            if project.hasCocoapods {
                DividerSection(title: "Cocoapods")
                TerminalCommandButton(project: project, command: .podInstall)
                TerminalCommandButton(project: project, command: .podUpdate)
                TerminalCommandButton(project: project, command: .podDeintegrate)
                if project.hasPodfileLock {
                    TerminalCommandButton(project: project, command: .removePodfileLock) {
                        preferences.updateProjectMenu = true
                    }
                }

            }

            customCommandButtons()

            DividerSection(title: "Preferences")
            if project.hasDerivedData {
                TerminalCommandButton(project: project,
                                      command: .clearProjectDerivedData,
                                      customName: "Clear \(project.name) derived data folder") {
                    preferences.updateProjectMenu = true
                }
            }

            Button(action: {
                let controller = ProjectPreferencesViewController(project: project,
                                                                  preferences: preferences,
                                                                  type: .project)
                controller.window?.title = "\(self.project.name)'s preferences"
                controller.showWindow(nil)
                AppDelegate.closePopover()
            }) {
                Text("Rename project")
            }

            Button(action: {
                preferences.removeProject(project)
            }) {
                Text("Remove \(project.name) from the list")
            }
        }
            .menuButtonStyle(BorderlessButtonMenuButtonStyle())

    }
}

extension ProjectMenuView {

    func customCommandButtons() -> some View {
        VStack {
            if !preferences.customTerminalCommands.isEmpty {
                DividerSection(title: "Custom commands")
                ForEach(preferences.customTerminalCommands, id: \.self) { customCommand in
                    CustomTerminalCommandButton(command: customCommand,
                                                project: project).environmentObject(preferences)
                }
            }
        }
    }
}

struct CustomTerminalCommandButton: View {
    let command: CustomCommand
    let project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        MenuButton(label: Text(command.name)) {
            TerminalCommandButton(project: project,
                                  command: .custom(command: command.fullCommand(for: project)))
            Button(action: {
                preferences.removeCustomTerminalCommand(command)
            }) {
                HStack(spacing: 4) {
                    Text("Remove \(command.name)")
                    Image(systemName: "minus.circle.fill")
                        .frame(width: 10, height: 10)
                }
            }
        }
    }
}

struct ProjectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMenuView(project: Project.dummy).environmentObject(Preferences())
    }
}
