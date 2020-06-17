//
//  AppDelegate.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 06/03/2020.
//  Copyright © 2020 com.dkcompany.xcodeprojects. All rights reserved.
//

import Cocoa

var statusItem: NSStatusItem?

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    private lazy var popover = NSPopover()
    private var eventMonitor: EventMonitor?
    private let preferences = Preferences()
    private lazy var statusController: StatusViewController = {
        StatusViewController(preferences: preferences)
    }()

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        updateButton()

        popover.contentViewController = statusController

        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            guard let self = self else { return }
            guard self.popover.isShown else { return }

            self.closePopover(sender: event)
        }
    }
}

// MARK: - UI
private extension AppDelegate {

     func updateButton() {
        guard let button = statusItem.button else {
            return
        }

        button.image = NSImage(named: "terminal")
        button.image?.size = NSSize(width: 15, height: 15)
        button.action = #selector(togglePopover)
    }
}

// MARK: - Actions
extension AppDelegate {

    @objc
    func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    

    func showPopover(sender: Any?) {
        guard let button = statusItem.button else {
            return
        }
        eventMonitor?.start()
        popover.show(
            relativeTo: button.bounds,
            of: button,
            preferredEdge: NSRectEdge.minY
        )
        NSApp.activate(ignoringOtherApps: true)
    }

    func closePopover(sender: Any?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
}

