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

