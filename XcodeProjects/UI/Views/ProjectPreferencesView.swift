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
            TextField(project.name, text: $newProjectName)

            Button(action: {
                self.preferences.changeProjectsName(self.project, newName: self.newProjectName)
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
