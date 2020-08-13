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
            TerminalCommandButton(project: self.project, command: .openInTerminal)
            TerminalCommandButton(project: self.project, command: .finder)

            if NSWorkspace.shared.sourceTreeAppInstalled {
                TerminalCommandButton(project: self.project, command: .sourceTree)
            }

            VStack { Divider() }
            if project.hasCocoapods {
                TerminalCommandButton(project: self.project, command: .podInstall)
                TerminalCommandButton(project: self.project, command: .podUpdate)
                VStack { Divider() }
            }

            Button(action: {
                let controller = ProjectPreferencesViewController(rootView: ProjectPreferencesView())
                controller.showWindow(nil)
            }) {
                Text("Preferences")
            }

            VStack { Divider() }
            Button(action: {
                self.preferences.removeProject(self.project)
            }) {
                Text("Remove \(self.project.name) from the list")
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
