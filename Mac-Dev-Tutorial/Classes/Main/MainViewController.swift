//
//  MainViewController.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/8.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa
import SnapKit

class MainViewController: NSViewController {
    
    private var tableView: NSTableView!
    private var scrollView: NSScrollView!
    
    private var dataSource: [String] = []
    
    override func loadView() {
        self.view = NSView.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
//    private var leftVC : LeftViewController = LeftViewController.init()
//    private var rightVC: RightViewController = RightViewController.init()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.addChild(leftVC)
//        self.addChild(rightVC)
//        leftVC.view.snp.makeConstraints { (make) in
//            make.width.lessThanOrEqualTo(300);
//            make.width.greaterThanOrEqualTo(100)
//        }
//        rightVC.view.snp.makeConstraints { (make) in
//            make.width.greaterThanOrEqualTo(300);
//            make.width.lessThanOrEqualTo(2000);
//        }
//    }
}


// MARK: - UI
extension MainViewController {
    private func initSubviews() {
        
    }
}


// MARK: - data
extension MainViewController {
    private func initData() {
        dataSource.append("SplitView")
    }
}




extension MainViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
       return dataSource.count
    }
}
