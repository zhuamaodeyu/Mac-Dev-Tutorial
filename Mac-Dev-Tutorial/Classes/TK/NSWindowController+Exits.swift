//
//  NSWindowController+Exits.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa



extension NSWindowController {
    public func updateWindowFrame(frame: NSRect) {
        self.window?.setFrame(frame, display: true)
    }
    
    
    public func set(title: String, icon name: String?) {
        self.window?.representedURL = URL.init(string: "WindowTitle")
        self.window?.title = title
        if let n = name {
            self.window?.standardWindowButton(.documentIconButton)?.image = NSImage.init(named: n)
        }
    }
    
}
