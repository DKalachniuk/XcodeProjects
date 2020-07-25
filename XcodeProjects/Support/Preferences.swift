//
//  Preferences.swift
//  StatusBuddy
//
//  Created by Dima Kalachniuk on 09/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Foundation
import Combine

final class Preferences: ObservableObject {

    static let didChangeNotification = Notification.Name("com.dkcompany.xcodeprojects.PrefsChanged")

    private var appURL: URL { Bundle.main.bundleURL }

    @Published private var _launchAtLoginEnabled: Bool = false
    @Published private var _hintDisabled: Bool = UserDefaultsConfig.hintDisabled
    @Published private var _showProjectIcon: Bool = UserDefaultsConfig.showProjectIcon
    @Published private var _projects: [Project] = []

    init() {
        _launchAtLoginEnabled = launchAtLoginEnabled

        if let projectsData = UserDefaultsConfig.projects {
            let projects = try? JSONDecoder().decode([Project].self, from: projectsData)
            _projects = projects ?? []
        } else {
            _projects = []
        }
    }

    private (set) var projects: [Project] {
        get {
            _projects
        }
        set (newProjects) {
            _projects = newProjects
            if let encodedProjects = try? JSONEncoder().encode(newProjects) {
                UserDefaultsConfig.projects = encodedProjects
            }
        }
    }

    private (set) var hintDisabled: Bool {
        get {
            _hintDisabled
        }
        set (newHintDisabled) {
            _hintDisabled = newHintDisabled
            UserDefaultsConfig.hintDisabled = _hintDisabled
        }
    }

    private (set) var showProjectIcon: Bool {
        get {
            _showProjectIcon
        }
        set (newShowProjectIcon) {
            _showProjectIcon = newShowProjectIcon
            UserDefaultsConfig.showProjectIcon = _showProjectIcon
        }
    }

    private (set) var launchAtLoginEnabled: Bool {
        get {
            _launchAtLoginEnabled || SharedFileList.sessionLoginItems().containsItem(appURL)
        }
        set {
            _launchAtLoginEnabled = newValue

            if newValue {
                SharedFileList.sessionLoginItems().addItem(appURL)
            } else {
                SharedFileList.sessionLoginItems().removeItem(appURL)
            }

            didChange()
        }
    }

    private func didChange() {
        NotificationCenter.default.post(name: Self.didChangeNotification, object: self)
    }
}

extension Preferences {
    func hideHint() {
        hintDisabled = true
    }

    func toggleShowProjectIcon() {
        showProjectIcon.toggle()
    }

    func toggleLaunchAtLogin() {
        launchAtLoginEnabled.toggle()
    }
}

extension Preferences {
    func addProjects(_ newProjects: [Project]) {
        projects.append(contentsOf: newProjects)
    }

    func moveProjects(from source: IndexSet, to destination: Int) {
        projects.move(fromOffsets: source, toOffset: destination)
    }

    func removeProject(_ project: Project) {
        projects.removeAll(where: { $0.name == project.name })
    }

    func removeAllProjects() {
        projects.removeAll()
    }
}
