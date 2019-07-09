//
//  NSLabel.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa

class NSLabel: NSView {
    public var text: String?
    public var attributeString: NSAttributedString?
    public var font: NSFont? = NSFont.systemFont(ofSize: NSFont.systemFontSize)
    public var color: NSColor? = NSColor.black
//    public var backgroundColor: NSColor? = NSColor.clear
    public var numberOfLines: Int = 1
    public var alignment: NSTextAlignment?
    public var lineBreakMode: NSLineBreakMode?
    public var preferredMaxLayoutWidth: Float = 0
    
    public convenience init() {
        self.init(frame: NSRect.zero)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NSLabel {
    
}
