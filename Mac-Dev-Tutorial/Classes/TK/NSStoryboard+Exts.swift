//
//  NSStoryboard+Exts.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/10.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa


extension NSStoryboard {
    public static func windowController(name: String, storyboard sname: String, bundle: Bundle? = nil) -> NSWindowController? {
        guard let windowController = NSStoryboard.init(name: sname, bundle: bundle).instantiateController(withIdentifier: name) as? NSWindowController else {
            return nil
        }
        return windowController
    }
    public static func viewController(name: String, storyboard sname: String, bundle: Bundle? = nil) -> NSViewController? {
        guard let viewController = NSStoryboard.init(name: sname, bundle: bundle).instantiateController(withIdentifier: name) as? NSViewController else {
            return nil
        }
        return viewController
    }
    
    
    public static func viewController(name: String, bundle: Bundle? = nil) -> NSViewController? {
        guard let viewController = NSStoryboard.init(name: name, bundle: bundle).instantiateInitialController() as? NSViewController else {
            return nil
        }
        return viewController
    }
    
    public static func windowController(name: String, bundle: Bundle? = nil) -> NSWindowController? {
        guard let windowController = NSStoryboard.init(name: name, bundle: bundle).instantiateInitialController() as? NSWindowController else {
            return nil
        }
        return windowController
    }
}

