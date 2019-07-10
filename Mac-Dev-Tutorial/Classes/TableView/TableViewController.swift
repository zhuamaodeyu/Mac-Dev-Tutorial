//
//  TableViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit

struct TableViewModel {
    var name: String?
    var age:Int = 0
    var address: String?
    var school: String?
    var home: String?
}



class TableViewController: NSViewController {

    private var tableView: NSTableView!
    private var scrollView: TableViewScrollView!
    
    private var dataSource: [TableViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDataSource()
        installSubviews()
        installSubviewConstaints()
        self.view.backgroundColor = NSColor.clear
    }
    
}


extension TableViewController {
    private func installSubviews() {
        scrollView = TableViewScrollView.init()
        scrollView.hasVerticalScroller =  false 
        scrollView.hasHorizontalScroller = false
        scrollView.focusRingType = .none
        scrollView.borderType = .noBorder
        scrollView.scrollerKnobStyle = .dark
        scrollView.scrollerStyle = .legacy
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = NSColor.clear
        scrollView.drawsBackground = false
        
        tableView = NSTableView.init()
        tableView.autoresizesSubviews = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.focusRingType = .none
        tableView.backgroundColor = NSColor.clear
        scrollView.documentView = tableView
        view.addSubview(scrollView)
        
        configTableView()
    }
    private func installSubviewConstaints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(NSEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    private func configTableView() {
        
        let nameCell = NSTableHeaderCell.init(textCell: "名字")
        nameCell.backgroundColor = NSColor.red
        nameCell.alignment = .center
        nameCell.textColor = NSColor.white
        let name = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("name"))
        name.title = "名字"
        name.headerCell.textColor = NSColor.white
        name.headerCell.alignment = .center
        name.headerCell = nameCell
        name.minWidth = 80
        tableView.addTableColumn(name)
        
        let age = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("age"))
        age.headerCell.alignment = .center
        age.title = "年龄"
        age.minWidth = 80
        tableView.addTableColumn(age)
        
        let address = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("address"))
        address.headerCell.alignment = .center
        address.title = "地址"
        address.minWidth = 80
        tableView.addTableColumn(address)
        
        let school = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("school"))
        school.headerCell.alignment = .center
        school.title = "学校"
        school.minWidth = 80
        tableView.addTableColumn(school)
        
        let home = NSTableColumn.init(identifier: NSUserInterfaceItemIdentifier.init("home"))
        home.headerCell.alignment = .center
        home.title = "🏠"
        home.minWidth = 80
        tableView.addTableColumn(home)
    }
    
    
    private func configDataSource() {
        dataSource.append(TableViewModel.init(name: "张三", age: 10, address: "上海", school: "xxxx", home: "snakgndkag"))
    }
}


extension TableViewController : NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return nil
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let model = self.dataSource[row]
        switch tableColumn?.identifier {
        case  NSUserInterfaceItemIdentifier.init("name"):
            return model.name
        case NSUserInterfaceItemIdentifier.init("age"):
            return model.age
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        switch tableColumn?.identifier {
        case NSUserInterfaceItemIdentifier.init("name"):
            var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("name_cell"), owner: self)
            if cell == nil {
                cell = NameTableViewCell.init()
                cell?.identifier = NSUserInterfaceItemIdentifier.init("name_cell")
            }
            cell?.wantsLayer = true
            cell?.backgroundColor = NSColor.randomColor
            return cell
        case NSUserInterfaceItemIdentifier.init("age"):
            var cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("age_cell"), owner: self)
            if cell == nil {
                cell = AgeTableViewCell.init()
                cell?.identifier = NSUserInterfaceItemIdentifier.init("age_cell")
            }
            cell?.wantsLayer = true
            cell?.backgroundColor = NSColor.randomColor
            return cell
        case NSUserInterfaceItemIdentifier.init("address"):
            break
        case NSUserInterfaceItemIdentifier.init("home"):
            break
        default:
            break
        }
        return nil
    }
}
