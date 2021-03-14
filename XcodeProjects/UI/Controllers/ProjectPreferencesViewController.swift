//
//  ProjectPreferencesViewController.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 13/08/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import Cocoa
import Combine
import SwiftUI

enum ProjectPreferencesType {
    case project
    case addTerminalCommand
}

class ProjectPreferencesViewController: NSWindowController {

    convenience init(project: Project? = nil, preferences: Preferences, type: ProjectPreferencesType) {
        let contentView = ProjectPreferencesView(type: type, project: project).environmentObject(preferences)
        let hostingController = NSHostingController(rootView: contentView.frame(width: 300, height: 140))
        let window = NSWindow(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 300, height: 140))
        self.init(window: window)

        NotificationCenter.default.addObserver(forName: .closePreferencesController, object: nil, queue: nil) { [self] _ in
            dismiss()
        }
    }

    func dismiss() {
        close()
        AppDelegate.closePopover()
    }
}
