//
//  Extensions.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa

public protocol CreateProtocol {
    associatedtype Element
    func create() -> Element?
}


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
    
    
    public func openPanel() {
        let panel = NSOpenPanel.init()
        panel.canChooseFiles = true
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = true
        panel.allowedFileTypes = [""]
        panel.begin { (result) in
            
        }
    }
    
}


extension NSAlert {
    public static func alert(title: String,
                             desc: String,
                             button titles:[String],
                             style: NSAlert.Style,
                             from window: NSWindow,
                             completion:@escaping ((NSApplication.ModalResponse)->Void)) {
        
        let alert = NSAlert.init()
        
        for t in titles {
            alert.addButton(withTitle: t)
        }
        //提示的标题
        alert.messageText = title
        //提示的详细内容
        alert.informativeText = desc
        //设置告警风格
        alert.alertStyle = style
        alert.beginSheetModal(for: window) { (returnCode) in
            completion(returnCode)
        }
    }
}

extension NSScrollView : CreateProtocol {
    public typealias Element = NSScrollView
    
    public func create() -> NSScrollView? {
        let scrollView = NSScrollView.init()
        scrollView.hasVerticalScroller =  false
        scrollView.hasHorizontalScroller = false
        scrollView.focusRingType = .none
        scrollView.borderType = .noBorder
        scrollView.scrollerKnobStyle = .dark
        scrollView.scrollerStyle = .legacy
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
}

extension NSTableView: CreateProtocol {
    public typealias Element = NSTableView
    
    public func create() -> NSTableView? {
        let tableView = NSTableView.init()
        tableView.autoresizesSubviews = true
        tableView.headerView = nil
        tableView.focusRingType = .none
        tableView.backgroundColor = NSColor.clear
        tableView.gridStyleMask = [.solidHorizontalGridLineMask, .solidVerticalGridLineMask]
        tableView.usesAlternatingRowBackgroundColors = true 
        return tableView
    }
    
    
    
    /// 添加 menu
    ///
    /// - Parameter item: <#item description#>
    public func addMenu(item: NSMenuItem) {
        var  menu = self.menu
        if menu == nil {
            menu = NSMenu.init()
        }
        menu?.addItem(item)
        menu?.delegate = self.delegate as? NSMenuDelegate
        self.menu = menu
    }

//
//    tableView = NSTableView.init()
//    tableView.autoresizesSubviews = true
//    tableView.headerView = nil
//    tableView.delegate = self
//    tableView.dataSource = self
//    tableView.focusRingType = .none
//
//    scrollView.documentView = tableView
//    view.addSubview(scrollView)
}

