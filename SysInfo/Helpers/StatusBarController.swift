//
//  StatusBarController.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import AppKit

class StatusBarController {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem
    private var popover: NSPopover

    init(_ popover: NSPopover)
    {
        self.popover = popover

        statusBar = NSStatusBar.system
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)

        if let statusBarButton = statusItem.button {

            let symbolConfig = NSImage.SymbolConfiguration(pointSize: 16, weight: .regular)
            if let image = NSImage(systemSymbolName: "externaldrive.connected.to.line.below",
                                   accessibilityDescription: "Сеть")?.withSymbolConfiguration(symbolConfig) {

                image.isTemplate = true        // обязательно!
                statusBarButton.image = image  // НЕ меняем размер вручную!
            }

            statusBarButton.action = #selector(togglePopover(sender:))
            statusBarButton.target = self
        }
    }

    @objc func togglePopover(sender: AnyObject) {
        if popover.isShown {
            hidePopover(sender)
        } else {
            showPopover(sender)
        }
    }

    func showPopover(_ sender: AnyObject) {
        if let statusBarButton = statusItem.button {
            popover.show(relativeTo: statusBarButton.bounds,
                         of: statusBarButton,
                         preferredEdge: .minY)
        }
    }

    func hidePopover(_ sender: AnyObject) {
        popover.performClose(sender)
    }
}
