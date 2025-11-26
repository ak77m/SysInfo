//
//  AppDelegate.swift
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    
    var net = Manager()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = MainView().environmentObject(net)

        let hostingController = NSHostingController(rootView: contentView)
        popover = NSPopover()
        popover.contentSize = NSSize(width: 350, height: 400)
        popover.contentViewController = hostingController
        popover.behavior = .transient  // <-- ВАЖНО!

        DispatchQueue.main.async {
            self.statusBar = StatusBarController(self.popover)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

