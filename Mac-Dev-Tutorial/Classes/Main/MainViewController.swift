//
//  MainViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit

class MainViewController: NSViewController {
    
    private var tableView: NSTableView!
    private var scrollView: NSScrollView!
    
    private var dataSource: [String] = []
    
    override func loadView() {
        self.view = NSView.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        initData()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
}


// MARK: - UI
extension MainViewController {
    private func initSubviews() {
        scrollView = NSScrollView.init()
        scrollView.hasVerticalScroller =  true
        scrollView.hasHorizontalScroller = false
        scrollView.focusRingType = .none
        scrollView.borderType = .noBorder
        scrollView.scrollerKnobStyle = .dark
        scrollView.scrollerStyle = .legacy
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tableView = NSTableView.init()
        tableView.autoresizesSubviews = true
        tableView.headerView = nil
        tableView.delegate = self
        tableView.dataSource = self
        tableView.focusRingType = .none
        tableView.addTableColumn(NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("")))
        scrollView.documentView = tableView
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(NSEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
}


// MARK: - data
extension MainViewController {
    private func initData() {
        dataSource.append("NSWindow")
        dataSource.append("NSView")
        dataSource.append("NSLabel")
        dataSource.append("NSTextField")
        dataSource.append("NSTextView")
        dataSource.append("NSImageView")
        dataSource.append("NSButton")
        dataSource.append("NSTableView")
        dataSource.append("NSAlert")
        dataSource.append("NSSplitView")
        dataSource.append("NSCollectionView")
        dataSource.append("NSPopover")
        dataSource.append("NSStepper")
        dataSource.append("NSSegmentedControl")
        dataSource.append("NSComboBox")
        dataSource.append("NSBox")
        dataSource.append("NSToolBar")
        dataSource.append("NSStatusBar")
        dataSource.append("NSContainerView")
        dataSource.append("NSMenu")
        dataSource.append("Custom View")
        dataSource.append("Animation")
    }
}

extension MainViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
       return dataSource.count
    }
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return nil
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("xxxx"), owner: self) as? MainTableViewCell
        if cell == nil {
            cell = MainTableViewCell.init(frame: NSRect.init())
            cell?.identifier = NSUserInterfaceItemIdentifier.init("xxxx")
        }
        cell?.objectValue = dataSource[row]
        return cell
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 55
    }
    func tableViewSelectionDidChange(_ notification: Notification) {

//        Process.run(command: "/usr/bin/env", args: [ "ruby", bunlder, "--version","LANG=en_US.UTF-8","--no-ansi"]) { (process, output, error) in
//            if let e = error {
//                print("\(e)")
//            }
//
//        }
        
        let cocoapods = Command.shared?.podInstall()
        
        
        switch tableView.selectedRow {
        case 0:
            
            break
        case 1:
            let wc = NSStoryboard.windowController(name: "ViewWindowController", storyboard: "View")
            wc?.window?.orderFront(nil)
            break
        case 2:
            break
        case 3:
            break
        case 4:
            let wc = NSStoryboard.windowController(name: "TextWindowController", storyboard: "TextView")
            wc?.window?.orderFront(nil)
            break
        case 5:
            break
        case 6:
            let wc = NSStoryboard.windowController(name: "ButtonWindowController", storyboard: "Button")
            wc?.window?.orderFront(nil)
            break
        case 7:
            let wc = NSStoryboard.windowController(name: "TableWindowController", storyboard: "TableView")
            wc?.window?.orderFront(nil)
            self.view.window?.close()
            break
            
        default:
            break
        }
    }
}
