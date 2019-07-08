//
//  DetailTableViewCell.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class DetailTableViewCell: NSTableCellView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.yellow.cgColor
        // Drawing code here.
    }
    
}
