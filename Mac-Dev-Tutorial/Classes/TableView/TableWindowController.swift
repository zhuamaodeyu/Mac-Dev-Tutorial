//
//  TableWindowController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

//您可以观察NSWindowWillCloseNotification来自第二个NSWindow对象的通知。
//你可以实现NSWindowDelegate方法windowShouldClose:或windowWillClose:。
//您可以子类化NSWindow并覆盖该performClose:方法。
//您可以向窗口添加“关闭”按钮，并将其连接到操作。
class TableWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        set(title: "TableView", icon: nil)
        self.window?.titlebarAppearsTransparent = true
        self.window?.backgroundColor = NSColor.withHex(hexString: "313234")
        
    }
}


extension TableWindowController:NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        
    }
}
