//
//  NameTableViewCell.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit

class NameTableViewCell: NSTableCellView {

    private var titleLabel: NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        installSubviews()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    private func installSubviews() {
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
    
    override var objectValue: Any? {
        didSet {
            titleLabel.stringValue = (objectValue as? String ?? "")
        }
    }
    
}
