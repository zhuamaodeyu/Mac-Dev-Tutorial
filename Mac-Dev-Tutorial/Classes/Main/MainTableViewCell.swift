//
//  MainTableViewCell.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit
class MainTableViewCell: NSTableCellView {

    private var titleLabel: NSTextField!
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        titleLabel =  NSTextField.init()
        titleLabel.isBordered = false
        titleLabel.isEditable = false
        titleLabel.drawsBackground = false 
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
        }
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
//        self.backgroundColor = NSColor.ran

        // Drawing code here.
    }
    
    override var objectValue: Any? {
        didSet {
            self.titleLabel.stringValue = (objectValue as! String)
        }
    }
}
