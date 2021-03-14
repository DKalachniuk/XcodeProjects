//
//  ProjectPreferencesView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 13/08/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct ProjectPreferencesView: View {
    let type: ProjectPreferencesType
    let project: Project?
    @State var newValue: String = ""
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                TextField(value, text: $newValue)
            }.padding()

            Button(action: {
                if value != newValue {
                    switch type {
                        case .project:
                            if let project = project {
                                preferences.changeProjectsName(project, newName: newValue)
                            }
                        case .addTerminalCommand:
                            let result = preferences.addNewTerminalCommand(newValue)
                            switch result {
                                case .failure(let error):
                                    NSWorkspace.showErrorAlert(withMessage: error.localizedDescription)
                                    break
                                case .success:
                                    break
                            }
                    }
                }
                NotificationCenter.default.post(name: .closePreferencesController, object: nil)
            }, label: { Text(saveButton) })
        }
    }
}

private extension ProjectPreferencesView {
    var title: String {
        switch type {
            case .project: return "New name"
            case .addTerminalCommand: return "Terminal command"
        }
    }
    var value: String {
        switch type {
            case .project: return project?.name ?? ""
            case .addTerminalCommand: return "New command"
        }
    }

    var saveButton: String {
        switch type {
            case .project: return "Rename"
            case .addTerminalCommand: return "Add new command"
        }
    }
}

struct ProjectPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectPreferencesView(type: .project, project: Project.dummy, newValue: "something")
    }
}
