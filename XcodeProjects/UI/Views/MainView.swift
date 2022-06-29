//
//  MainView.swift
//  StatusBuddy
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import SwiftUI

struct MainView: View {

    @State private var searchTerm = ""
    //@State private var listToShow: ListToDisplay = .projects
    @State private var listToShow: Int = 0
    @EnvironmentObject var preferences: Preferences

//    enum ListToDisplay: Int {
//        case projects = 0
//        case aliases
//    }
    
    private var projects: [Project] {
        preferences.projects.filter({ searchTerm.isEmpty ? true : $0.name.lowercased().contains(searchTerm.lowercased()) })
    }

    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 15) {
                Spacer().frame(width: 0)
                TextField("Search", text: $searchTerm)
                    .frame(width: 215)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                AddProjectButton(action: addProject)
                AddCustomCommandButton(action: addCustomCommand)
                PreferencesView()
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10))

            Divider().padding([.top], 3)

            if listToShow == 0  {
                if projects.isEmpty {
                    Spacer()
                    if searchTerm.isEmpty {
                        VStack {
                            HStack {
                                Text("Please add a project")
                                AddProjectButton(action: addProject)
                            }
                        }

                    } else {
                        Text("No projects")
                    }
                    Spacer()
                } else {
                    VStack {
                        if self.preferences.hintDisabled == false {
                            HintView().environmentObject(self.preferences)
                        }
                        List {
                            ForEach(projects) { project in
                                ProjectCell(project: project).environmentObject(self.preferences)
                            }
                            .onMove(perform: move)
                        }
                        .padding(0)
                    }
                }
            } else {
                List {
                    ForEach(Alias.example) { alias in
                        AliasdButton(alias: alias, completion: nil)
                    }
                }
            }
            
            
            Divider().padding([.top], 3)
            Picker("", selection: $listToShow) {
                            Text("Projects").tag(0)
                            Text("Aliases").tag(1)
                        }
                        .pickerStyle(SegmentedPickerStyle())
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        if searchTerm.isEmpty {
            preferences.moveProjects(from: source, to: destination)
        }
    }
}

extension MainView {
    private func addProject() {
        let appDelegate: AppDelegate? = NSApplication.shared.delegate as? AppDelegate
        let dialog = NSOpenPanel()
        dialog.title = "Choose a folder with your project/workspace"
        dialog.showsResizeIndicator = true
        dialog.showsHiddenFiles = false
        dialog.canChooseDirectories = true
        dialog.canCreateDirectories = true
        dialog.allowsMultipleSelection = true
        dialog.canChooseFiles = false
        dialog.becomesKeyOnlyIfNeeded = true

        appDelegate?.closePopover(sender: nil)

        if dialog.runModal() == NSApplication.ModalResponse.OK {
            let projectUrls = dialog.urls
            let projects = projectUrls.compactMap { Project(url: $0) }
            preferences.addProjects(projects)
            appDelegate?.showPopover(sender: nil)
        } else {
            print("something went wrong")
            appDelegate?.showPopover(sender: nil)
        }
    }
    
    private func addCustomCommand() {
        let controller = ProjectPreferencesViewController(preferences: preferences,
                                                          type: .addTerminalCommand)
        controller.window?.title = "Add custom command"
        controller.showWindow(nil)
        AppDelegate.closePopover()
    }
}
