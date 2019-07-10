//
//  TableViewScrollView.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class TableViewScrollView: NSScrollView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        transparentizeHeaderClipView()
        // Drawing code here.
    }
    private func transparentizeHeaderClipView() {
        removeView(v: self)
    }
    
    
    private func removeView(v: NSView) {
        for view in v.subviews {
            if ((view as? NSVisualEffectView) != nil) {
                view.removeFromSuperview()
            }
            removeView(v: view)
        }
    }
    
}
