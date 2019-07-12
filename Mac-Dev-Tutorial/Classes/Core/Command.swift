//
//  CocoaPods.swift
//  Mac-Dev-Tutorial
//
//  Created by akulaku on 2019/7/12.
//  Copyright © 2019 zhuamaodeyu. All rights reserved.
//

import Cocoa

class Command {
    static let shared = Command.init()
    
    private let shell = ProcessInfo.processInfo.environment["SHELL"]
    private let path = ProcessInfo.processInfo.environment["PATH"]
    private let logname = ProcessInfo.processInfo.environment["LOGNAME"]
    private let user = ProcessInfo.processInfo.environment["USER"]

    
    private init?() {
        guard let _ = self.shell else {
            return nil
        }
    }
}


extension Command {
    public func which(command name: String) -> String? {
        guard let shell = self.shell else {
            return nil
        }
        if let path = Process.run(command: shell, args: ["-l","-c","which \(name)"]) {
            return path
        }
        return nil
    }
}



// MARK: - open
extension Command {
    public func xcodeOpen() {
        
    }
    public func vscodeOpen() {
        
    }
}



// MARK: - cocoapods
extension Command {
    public func podInstall() {
        guard let path = which(command: "pod")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
    public func podUpdate() {
        guard let path = which(command: "pod")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
    public func podSearch() {
        guard let path = which(command: "pod")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
}



// MARK: - xcode build
extension Command {
//    http://liumh.com/2015/11/25/ios-auto-archive-ipa/
    public func xcodeBuild() {
        guard let path = which(command: "xcodebuild")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
    
    public func xcodeArchive() {
//        xcodebuild archive -workspace 项目名称.xcworkspace
//        -scheme 项目名称
//        -configuration 构建配置
//        -archivePath archive包存储路径
//        CODE_SIGN_IDENTITY=证书
//        PROVISIONING_PROFILE=描述文件UUID
        guard let path = which(command: "xcodebuild")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
    
    public func xcodeList() {
        guard let path = which(command: "xcodebuild")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
    }
    
    public func xcodeExportArchive() {
        guard let path = which(command: "xcodebuild")?.trimmingCharacters(in: .newlines), !path.isEmpty else {
            return
        }
        
//        xcodebuild -exportArchive -archivePath archive文件的地址.xcarchive
//        -exportPath 导出的文件夹地址
//        -exportOptionsPlist exprotOptionsPlist.plist
//        CODE_SIGN_IDENTITY=证书
//        PROVISIONING_PROFILE=描述文件UUID
        
    }
}


