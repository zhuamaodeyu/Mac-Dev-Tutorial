//
//  LeftViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class LeftViewController: NSViewController {

    override func loadView() {
        self.view = NSView.init()
        print("\(self) + \(#function)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
//        self.view.layer?.backgroundColor = NSColor.blue.cgColor
    }
    
}
