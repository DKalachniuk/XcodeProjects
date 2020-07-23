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
        MenuButton(label: Image("gear").resizable().frame(width: 16, height: 16)) {

            Button(action: openGithub, label: { Text("Open in GitHub") })

            if !self.preferences.projects.isEmpty {
                Button(action: removeProjects, label: { Text("Remove All Projects") })
            }

            Button(action: clearDerivedData, label: { Text("Clear Xcode derived data") })
            VStack { Divider() }

            Button(action: toggleLaunchAtLogin, label: {
                HStack(spacing: 4) {
                    Image("checkmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .opacity(self.preferences.launchAtLoginEnabled ? 1 : 0)
                    Text("Launch at Login")
                }.offset(x: -14, y: 0)
            })
            VStack { Divider() }

            Button(action: quit, label: { Text("Quit") })
        }
        .menuButtonStyle(BorderlessButtonMenuButtonStyle())
        .frame(width: 16, height: 16)
    }
}

private extension PreferencesView {
    func toggleLaunchAtLogin() {
        preferences.launchAtLoginEnabled.toggle()
    }

    func openGithub() {
        if let githubURL = URL(string: "https://github.com/DKalachniuk/XcodeProjects") {
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
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
