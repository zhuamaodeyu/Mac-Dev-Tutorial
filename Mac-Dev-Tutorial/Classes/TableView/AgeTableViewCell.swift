//
//  AgeTableViewCell.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit

class AgeTableViewCell: NSTableCellView {

    private var button: NSButton!
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        installSubviews()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    private func installSubviews() {
        button = NSButton.init()
        button.title = "CESHI"
        button.alignment = .center
        button.setButtonType(.pushOnPushOff)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
    }
}


