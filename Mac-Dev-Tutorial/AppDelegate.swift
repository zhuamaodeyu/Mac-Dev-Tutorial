//
//  AppDelegate.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var windowController: MainWindowController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController = MainWindowController.init(window:
            NSWindow.init(contentRect: NSRect.init(x: 0, y: 0, width: 1000, height: 500),
                          styleMask: [.titled,.resizable,.closable,.miniaturizable],
                          backing: .buffered,
                          defer: false))
        
        self.windowController.showWindow(self)
    }    
}

