//
//  EventMonitor.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/20.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Cocoa

// Brought to you by: https://www.raywenderlich.com/450-menus-and-popovers-in-menu-bar-apps-for-macos

public class EventMonitor {
    private var monitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void

    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }

    deinit {
        stop()
    }

    public func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
    }

    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}
