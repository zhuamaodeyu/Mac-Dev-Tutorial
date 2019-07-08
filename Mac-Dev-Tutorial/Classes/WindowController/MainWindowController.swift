//
//  MainWindowController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    
    override init(window: NSWindow?) {
        super.init(window: window)
        window?.delegate = self
        windowDidLoad()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadWindow() {
        print("\(#function)")
    }
    override func windowWillLoad() {
        print("\(#function)")
    }
    override func windowDidLoad() {
        super.windowDidLoad()
        configWindowFrameSize()
        self.window?.backgroundColor = NSColor.red
        setWindowIcon()
        self.contentViewController = MainViewController.init()
    }

}

extension MainWindowController {
    private func configWindowFrameSize() {
        var frame = NSScreen.main?.visibleFrame
        frame?.size.width = 1000
        frame?.size.height = 500
        self.window?.setFrame(frame!, display: true)
    }
    
    
    private func setWindowIcon() {
        self.window?.representedURL = URL.init(string: "WindowTitle")
        self.window?.title = "CESHI"
        self.window?.standardWindowButton(.documentIconButton)?.image = NSImage.init(named: "windowIcon")
    }
    
}


extension MainWindowController: NSWindowDelegate {
    private func windowDidMiniaturize(notification: NSNotification) {
        print("Window minimized")
    }
    
    private func windowWillClose(notification: NSNotification) {
        print("Window closing")
    }
    func windowWillClose(_ notification: Notification) {
        print("windowWillClose")
    }
}
