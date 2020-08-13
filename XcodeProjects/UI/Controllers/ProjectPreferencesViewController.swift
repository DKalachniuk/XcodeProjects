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

   convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView: rootView.frame(width: 300, height: 300))
        let window = NSWindow(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 300, height: 300))
        self.init(window: window)
    }
}
