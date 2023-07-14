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
    @State private var showingRemoveAllProjectsAlert = false
    @State private var showAliases = UserDefaultsConfig.showAliases

    var body: some View {
        MenuButton(label: Image("gear")) {

            DividerSection(title: "About")
            Button(action: openGithub, label: { Text("Open in GitHub") })

            DividerSection(title: "Derived Data")
            Button(action: openDerivedData, label: { Text(TerminalCommand.openXcodeDerivedData.title) })
            Button(action: clearDerivedData, label: { Text("Clear derived data") })

            Group {
                DividerSection(title:"Preferences")
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

                Button(action: {
                    let controller = ProjectPreferencesViewController(preferences: preferences,
                                                                      type: .addTerminalCommand)
                    controller.window?.title = "Add custom command"
                    controller.showWindow(nil)
                    AppDelegate.closePopover()
                }, label: { Text("Add custom command") })
            }

            if !self.preferences.projects.isEmpty {
                DividerSection(title: nil)
                Button("Remove All projects") {
                    showingRemoveAllProjectsAlert = true
                }
            }
            Group {
                DividerSection(title: nil)
                let text = showAliases ? "Turn Off Aliases Tab" : "Turn On Aliases Tab"
                Button(text) {
                    preferences.toggleShowAliases()
                    showAliases.toggle()
                }

                DividerSection(title: nil)
                Button(action: quit, label: { Text("Quit") })
            }
            
        }
        .menuButtonStyle(BorderlessButtonMenuButtonStyle())
        .alert(isPresented: $showingRemoveAllProjectsAlert, content: {
            Alert(title: Text("Remove all projects"),
                  message: Text("You can't undo it later"),
                  primaryButton: .default(Text("Remove"), action: {
                    removeProjects()
                  }),
                  secondaryButton: .cancel(Text("No")))
        })
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
