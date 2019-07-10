//
//  ButtonViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class ButtonViewController: NSViewController {

    private var button1: NSButton!
    private var button2: NSButton!
    private var button3: NSButton!
    private var button4: NSButton!
    
    
    private var button5: NSButton!
    private var button6: NSButton!
    private var button7: NSButton!
    private var button8: NSButton!
    private var button9: NSButton!
    private var button10: NSButton!
    private var button11: NSButton!
    private var button12: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installSubviews()
        initSubviews()
    }
    
    private func installSubviews() {
        button1 = NSButton.init()
        button1.frame = NSRect.init(x: 0, y: 0, width: 100, height: 50)
        // 样式
//        button1.bezelStyle = .helpButton
        view.addSubview(button1)
        
        
        button2 = NSButton.init(title: "测试", target: self, action: #selector(buttonAction))
        button2.frame = NSRect.init(x: 0, y: 50, width: 100, height: 50)
        view.addSubview(button2)
        
        button3 = NSButton.init(checkboxWithTitle: "smlsmlds", target: self , action: #selector(buttonAction))
        button3.frame = NSRect.init(x: 0, y: 100, width: 100, height: 50)
        view.addSubview(button3)
        
        button4 = NSButton.init(radioButtonWithTitle: "xxxxx", target: self , action: #selector(buttonAction))
        button4.frame = NSRect.init(x: 0, y: 150, width: 100, height: 50)
        view.addSubview(button4)
        
        button5 = NSButton.init(title: "xxxxx", image: NSImage.init(named: "windowIcon")!, target: self, action: #selector(buttonAction))
        button5.frame = NSRect.init(x: 0, y: 200, width: 100, height: 50)
        view.addSubview(button5)
    }
    
    
    private func initSubviews() {
        button6 = NSButton.init(frame: NSRect.init(x: 100, y: 0, width: 100, height: 50))
        // 备用状态 没测出来
        button6.alternateTitle = "xxxx"
        // 边框
//        bezelStyle
//        button6.title = "qqqq"
        view.addSubview(button6)
    }
    
}


extension ButtonViewController {
    @objc private func buttonAction() {
        
    }
}
