//
//  ProjectMenuView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct ProjectMenuView: View {

    @State var project: Project
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        MenuButton(label:
        Text(self.project.name).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))) {
            TerminalCommandButton(project: self.project, command: .openInTerminal)
            TerminalCommandButton(project: self.project, command: .finder)
            TerminalCommandButton(project: self.project, command: .sourceTree)

            VStack { Divider() }
            TerminalCommandButton(project: self.project, command: .podInstall)
            TerminalCommandButton(project: self.project, command: .podUpdate)
            VStack { Divider() }

            Button(action: {
                self.preferences.removeProject(self.project)
            }) {
                Text("Remove \(self.project.name) from the list")
            }

        }
        .menuButtonStyle(BorderlessButtonMenuButtonStyle())
        .frame(width: 220, height: 30, alignment: .center)

    }
}

struct ProjectMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectMenuView(project: Project.dummy).environmentObject(Preferences())
    }
}
