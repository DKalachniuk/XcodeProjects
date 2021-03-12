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
                VStack { Divider() }
            }

            if project.hasDerivedData {
                TerminalCommandButton(project: project, command: .clearProjectDerivedData)
                VStack { Divider() }
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

struct ProjectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMenuView(project: Project.dummy).environmentObject(Preferences())
    }
}
