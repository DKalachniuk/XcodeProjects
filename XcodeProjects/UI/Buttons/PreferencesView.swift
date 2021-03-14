//
//  PreferencesView.swift
//  StatusBuddy
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        MenuButton(label: Image("gear")) {

            Button(action: openGithub, label: { Text("Open in GitHub") })

            if !self.preferences.projects.isEmpty {
                Button(action: removeProjects, label: { Text("Remove All Projects") })
            }

            VStack { Divider() }
            Button(action: openDerivedData, label: { Text(TerminalCommand.openXcodeDerivedData.title) })
            Button(action: clearDerivedData, label: { Text("Clear Xcode derived data") })
            VStack { Divider() }

            Button(action: toggleLaunchAtLogin, label: {
                HStack(spacing: 4) {
                    Image(systemName: "checkmark")
                        .frame(width: 10, height: 10)
                        //.opacity(self.preferences.launchAtLoginEnabled ? 1 : 0)
                        .if(self.preferences.launchAtLoginEnabled == false) {
                            $0.hidden()
                        }
                    Text("Launch at Login")
                }.offset(x: -14, y: 0)
            })

            Button(action: toggleShowProjectIcon, label: {
                HStack(spacing: 4) {
                    Image(systemName: "checkmark")
                        .frame(width: 10, height: 10)
                        //                        .opacity(self.preferences.showProjectIcon ? 1 : 0)
                        .if(self.preferences.showProjectIcon == false) {
                            $0.hidden()
                        }
                    Text("Show project's icon")
                }.offset(x: -14, y: 0)
            })

            Group {
                VStack { Divider() }
                Button(action: {
                    let controller = ProjectPreferencesViewController(project: Project.dummy,
                                                                      preferences: preferences,
                                                                      type: .addTerminalCommand)
                    controller.window?.title = "Add custom command"
                    controller.showWindow(nil)
                    AppDelegate.closePopover()
                }, label: { Text("Add custom command") })

                VStack { Divider() }
                Button(action: quit, label: { Text("Quit") })
            }
        }

        .menuButtonStyle(BorderlessButtonMenuButtonStyle())
    }
}

private extension PreferencesView {
    func toggleLaunchAtLogin() {
        preferences.toggleLaunchAtLogin()
    }

    func toggleShowProjectIcon() {
        preferences.toggleShowProjectIcon()
    }

    func openGithub() {
        if let githubURL = URL(string: "https://github.com/DKalachniuk/XcodeProjects") {
            AppDelegate.closePopover()
            _ = NSWorkspace.shared.open(githubURL)
        }
    }

    func removeProjects() {
        preferences.removeAllProjects()
    }

    func quit() {
        NSApp.terminate(nil)
    }

    func clearDerivedData() {
        NSWorkspace.execute(command: .clearXcodeDerivedData)
    }

    func openDerivedData() {
        NSWorkspace.execute(command: .openXcodeDerivedData)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
