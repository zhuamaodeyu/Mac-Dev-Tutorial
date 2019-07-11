//
//  TextViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/11.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController {

    private var textView: NSTextView!
    private var scrollView: NSScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView = NSTextView.init()
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = false
        view.addSubview(textView)
        
        scrollView = NSScrollView.init()
        scrollView.hasVerticalScroller =  true
        scrollView.hasHorizontalScroller = false
        scrollView.focusRingType = .none
        scrollView.borderType = .noBorder
        scrollView.scrollerKnobStyle = .dark
        scrollView.scrollerStyle = .legacy
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.documentView = textView
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(100)
        }
        textView.snp.makeConstraints { (make) in
            make.edges.equalTo(NSEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
}
