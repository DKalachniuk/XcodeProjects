//
//  ProjectPreferencesView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 13/08/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct ProjectPreferencesView: View {
    let project: Project
    @State var newProjectName: String = ""
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("New name")
                TextField(project.name, text: $newProjectName)
            }.padding()

            Button(action: {
                if project.name != newProjectName {
                    preferences.changeProjectsName(project, newName: newProjectName)
                }
                NotificationCenter.default.post(name: .closePreferencesController, object: nil)
            }, label: { Text("Save") })
        }
        .onAppear {
            self.newProjectName = self.project.name
        }

    }
}

struct ProjectPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectPreferencesView(project: Project.dummy, newProjectName: "something")
    }
}
