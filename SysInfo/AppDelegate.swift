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
        // Create the SwiftUI view that provides the contents
        let contentView = MainView().environmentObject(net)
        
        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentViewController = MainViewController()
        //popover.contentSize.width = 300
        popover.contentSize = NSSize(width: 350, height: 400)
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        
        // Create the Status Bar Item with the Popover
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

