//
//  EventMonitor.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import Cocoa

class EventMonitor {
    // храним два монитора: глобальный и локальный
    private var globalMonitor: Any?
    private var localMonitor: Any?
    private let mask: NSEvent.EventTypeMask
    private let handler: (NSEvent?) -> Void

    public init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
        self.mask = mask
        self.handler = handler
    }

    public func start() {
        // Global: вызывается когда приложение НЕ активно (global monitor не вызывает, когда приложение активно)
        if globalMonitor == nil {
            globalMonitor = NSEvent.addGlobalMonitorForEvents(matching: mask) { [weak self] event in
                self?.handler(event)
            }
        }

        // Local: вызывается когда приложение активно — нужен, чтобы ловить клики внутри приложения
        if localMonitor == nil {
            localMonitor = NSEvent.addLocalMonitorForEvents(matching: mask) { [weak self] event in
                // вызываем наш обработчик (возвращаем event, чтобы событие продолжило обработку системой)
                self?.handler(event)
                return event
            }
        }
    }

    public func stop() {
        if let g = globalMonitor {
            NSEvent.removeMonitor(g)
            globalMonitor = nil
        }
        if let l = localMonitor {
            NSEvent.removeMonitor(l)
            localMonitor = nil
        }
    }

    deinit {
        stop()
    }
}
