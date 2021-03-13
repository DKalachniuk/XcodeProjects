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

class ProjectPreferencesViewController<RootView : View>: NSWindowController {

    convenience init(project: Project, preferences: Preferences) {
        let contentView = ProjectPreferencesView(project: project).environmentObject(preferences)
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
