//
//  NSAlert+Exts.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa


extension NSAlert {
    public static func alert(title: String,
                             desc: String,
                             button titles:[String],
                             style: NSAlert.Style,
                             from window: NSWindow,
                             completion:@escaping ((NSApplication.ModalResponse)->Void)) {
        
        let alert = NSAlert.init()
        
        for t in titles {
            alert.addButton(withTitle: t)
        }
        //提示的标题
        alert.messageText = title
        //提示的详细内容
        alert.informativeText = desc
        //设置告警风格
        alert.alertStyle = style
        alert.beginSheetModal(for: window) { (returnCode) in
            completion(returnCode)
        }
    }
}
