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

            VStack { Divider() }
            if project.hasCocoapods {
                TerminalCommandButton(project: project, command: .podInstall)
                TerminalCommandButton(project: project, command: .podUpdate)
                TerminalCommandButton(project: project, command: .podDeintegrate)
                if project.hasPodfileLock {
                    TerminalCommandButton(project: project, command: .removePodfileLock) {
                        preferences.updateProjectMenu = true
                    }
                }
                VStack { Divider() }
            }

            if project.hasDerivedData {
                TerminalCommandButton(project: project, command: .clearProjectDerivedData) {
                    preferences.updateProjectMenu = true
                }
                VStack { Divider() }
            }

            customCommandButtons()

            Button(action: {
                let controller = ProjectPreferencesViewController(project: project,
                                                                  preferences: preferences,
                                                                  type: .project)
                controller.window?.title = "\(self.project.name)'s preferences"
                controller.showWindow(nil)
                AppDelegate.closePopover()
            }) {
                Text("Preferences")
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
            ForEach(preferences.customTerminalCommands, id: \.self) { customCommand in
                HStack {
                    TerminalCommandButton(project: project,
                                          command: .custom(command: customCommand))
                    Button(action: {
                        preferences.removeCustomTerminalCommand(customCommand)
                    }) {
                        Image(systemName: "minus.circle.fill")
                    }
                }
            }
            if !preferences.customTerminalCommands.isEmpty {
                VStack { Divider() }
            }
        }
    }
}

struct ProjectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMenuView(project: Project.dummy).environmentObject(Preferences())
    }
}
