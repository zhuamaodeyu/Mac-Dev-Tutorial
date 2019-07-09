//
//  NSTableView+Exts.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa


extension NSTableView {
    public func makeView(withIdentifier: String, owner: Any?) {
        makeView(withIdentifier: NSUserInterfaceItemIdentifier.init(withIdentifier), owner: owner)
    }
}
