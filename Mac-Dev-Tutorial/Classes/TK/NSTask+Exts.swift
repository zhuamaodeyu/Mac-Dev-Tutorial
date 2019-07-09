//
//  NSTask+Exts.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/9.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Foundation
import Cocoa

extension Process {
    
    /// 打开APP
    ///
    /// - Parameter path: 可执行文件路径
    public static func openAppWith(exec path: String) {
        let process = Process.init()
        process.launchPath = path
        process.launch()
    }
    // 不是这个路径， 在 包目录下
//    [[NSWorkspace sharedWorkspace] fullPathForApplication:@"Pages"];
    
    
    
    /// app 多开
    ///
    /// - Parameter args: args  main 函数中可以获得参数
    public static func moreAction(args:[String] = []) {
        let path = Bundle.main.executablePath
        let process = Process.init()
        process.launchPath = path
        process.arguments = args
        process.launch()
    }
    
    
    
    /// 执行 命令
    ///
    /// - Parameters:
    ///   - path: path
    ///   - args: 参数
    ///   - complation: 执行结果回调
    public static func run(command path :String, args: [String] = [], environment:[String:String] = [:],complation:((_ process: Process,_ output: String?, _ error:String?)-> Void)? = nil) {
        let process = Process.init()
        process.launchPath = path
        process.arguments = args
        
        for (key,value) in environment {
            process.environment?.updateValue(value, forKey: key)
        }
        let pipe = Pipe.init()
        process.standardOutput = pipe
        
        let errPipe = Pipe.init()
        process.standardError = errPipe
        
        process.launch()
//
//        pipe.fileHandleForReading.readabilityHandler = { pipe in
//            complation?(process,
//                String(data: pipe.availableData, encoding: .utf8), nil)
//        }
//        errPipe.fileHandleForReading.readabilityHandler = { pipe in
//            complation?(process,
//                       nil,
//                       String(data: pipe.availableData, encoding: .utf8))
//        }
//
        complation?(process,
                    String.init(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: String.Encoding.utf8),
                    String.init(data: errPipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8))

    }
    
    
    
    /// root 运行
    /// STPrivilegedTask 解决方案
    /// - Parameters:
    ///   - path: command path
    ///   - arg: args
    ///   - complation: <#complation description#>
    public static func runRoot(command path: String, arg:[String] = [], complation:((_ output: String?, _ error:String?)-> Void)? = nil) {
//        STPrivilegedTask
        var errDic: NSDictionary?
        let argsString = arg.joined(separator: " ")
        let script = "do shell script \"\(path) \(argsString)\" with administrator privileges"
        let appScript = NSAppleScript.init(source: script)
        let eventResult = appScript?.executeAndReturnError(&errDic)
        if eventResult?.booleanValue ?? false {
            
            var errorMessage:String? = nil
            
            if let errorCode = errDic?.value(forKey: NSAppleScript.errorNumber) as? NSNumber, errorCode.intValue == -128 {
                errorMessage = "The administrator password is required to do this."
            }
            
            if errorMessage?.isEmpty ?? true {
                 errorMessage = errDic?.value(forKey: NSAppleScript.errorMessage) as? String
            }
            complation?(nil, errorMessage)
        }else {
            complation?(eventResult?.stringValue, nil)
        }
    }
    
}
