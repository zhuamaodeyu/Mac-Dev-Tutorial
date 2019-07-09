//
//  RightViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit
class RightViewController: NSViewController {
    
    private var tableView: NSTableView!
    private var scrollView: NSScrollView!
    override func loadView() {
        self.view = NSView.init()
        print("\(self) + \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        initSubviews()
    }
}

extension RightViewController {
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
        
        scrollView.documentView = tableView
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(NSEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
        
//        let label = NSLabel.init(labelWithString: "")
        
        
    }
}


extension RightViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
         return 200
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("NSTableView"), owner: self)
        if cell == nil {
            cell = DetailTableViewCell.init()
            cell?.identifier = NSUserInterfaceItemIdentifier.init("NSTableView")
        }
        return cell
    }
    
//    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
//        var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("NSTableView"), owner: self) as? DetailTableViewCell
//        if cell == nil {
//            cell = DetailTableViewCell.init()
//            cell?.identifier = NSUserInterfaceItemIdentifier.init("NSTableView")
//        }
//        return cell as? NSTableRowView
//    }
    
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        
        return true
    }
}
