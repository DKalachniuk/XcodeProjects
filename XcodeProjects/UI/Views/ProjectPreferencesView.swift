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
    @State var newCommandTitle: String = ""
    @State var newValue: String = ""
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                if type == .addTerminalCommand {
                    Text(titleAddTheCommand)
                    TextField(titleAddTheCommand, text: $newCommandTitle)
                }
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
                            let result = preferences.addNewTerminalCommand(CustomCommand(name: newCommandTitle, command: newValue))
                            switch result {
                                case .failure(let error):
                                    NSWorkspace.showErrorAlert(withMessage: error.localizedDescription)
                                    break
                                case .success:
                                    break
                            }
                    }
                    NotificationCenter.default.post(name: .closePreferencesController, object: nil)
                }
            }, label: { Text(saveButton) })
            .disabled(newValue.isEmpty)
        }
    }
}

private extension ProjectPreferencesView {
    
    var titleAddTheCommand: String {
        "Name of the command"
    }
    
    var title: String {
        switch type {
            case .project: return "New name"
        case .addTerminalCommand: return "Terminal command"
        }
    }
    var value: String {
        switch type {
            case .project: return project?.name ?? ""
            case .addTerminalCommand: return "cd <path to your project> will be added automatically"
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
