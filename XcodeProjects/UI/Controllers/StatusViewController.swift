//
//  EventMonitor.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/20.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Cocoa
import Combine
import SwiftUI

class StatusViewController: NSViewController {

    let preferences: Preferences

    init(preferences: Preferences) {
        self.preferences = preferences
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = NSView()

        preferredContentSize = NSSize(width: 300, height: 300)

        let contentView = MainView().environmentObject(preferences)

        let hoster = NSHostingController(rootView: contentView)
        addChild(hoster)
        hoster.view.autoresizingMask = [.width, .height]
        hoster.view.frame = view.bounds
        view.addSubview(hoster.view)
    }
    
}
