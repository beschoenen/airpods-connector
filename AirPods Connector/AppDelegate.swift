//
//  AppDelegate.swift
//  AirPods Connector
//
//  Created by Kevin Richter on 15/07/2018.
//  Copyright © 2018 Kevin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, BluetoothConnectorListener {

    let bluetooth = BluetoothConnector()
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        bluetooth.register(listener: self)

        self.setStatusItemIProps()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func setStatusItemIProps() {
        guard let button = statusItem.button else { return }

        if bluetooth.isConnected {
            button.image = NSImage(named:NSImage.Name("icon-inverted"))
            button.action = #selector(disconnect(_:))
        } else {
            button.image = NSImage(named:NSImage.Name("icon"))
            button.action = #selector(connect(_:))
        }
    }

    func connected() {
        self.setStatusItemIProps()
    }

    func disconnected() {
        self.setStatusItemIProps()
    }

    @objc func connect(_ sender: Any?) {
        bluetooth.connect()
    }

    @objc func disconnect(_ sender: Any?) {
        bluetooth.disconnect()
    }

}

