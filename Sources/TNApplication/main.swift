//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import TNServer
import TNCommon


/// 设定工作目录
let workingDir = Dir(TNServer.TNDir.resource.rawValue)
if !workingDir.exists {
    do {
        try workingDir.create()
        print("Working Directory (\(workingDir.path)) for examples created.")
    } catch {
        print("Could not create Working Directory.")
    }
}

/// 设置工作空间
do {
    try workingDir.setAsWorkingDir()
    print("Working Directory set.")
} catch {
    print("Could not set Working Directory.")
}


///// 创建文件
//let thisFile = File("category.json")
//try! thisFile.open(.readWrite)
//defer {
//    thisFile.close()
//}
//
//var contents = try! thisFile.readString()
////print(contents)
//print("++++++++")
//var start = contents.characters.startIndex
//var end = contents.characters.endIndex
//
//
//var tempStr = contents
//for index in 0...contents.characters.count {
//    
//    let char = contents.charAt(index: index)
//    if char == "{" {
//        start = tempStr.characters.index(of: char!)!
//    }
//    
//    if char == "}" {
//        end = tempStr.characters.index(of: char!)!
//        var substring = String(tempStr.characters[start ... end])
//        tempStr = contents[contents.index(contents.startIndex, offsetBy: index + 1) ..< contents.characters.endIndex]
//        substring.replaceSubrange(substring.startIndex...substring.index(substring.startIndex, offsetBy: 1), with: "[")
//        substring.replaceSubrange(substring.index(substring.endIndex, offsetBy: -1)..<substring.endIndex, with: "]")
//        print(substring)
//
//    }
//    
//}


/// 创建服务器
let server = TNServer().server

/// 配置服务器
configureServer(server)

do {
	/// 启动服务器
	try server.start()
} catch PerfectError.networkError(let err, let msg) {
	print("Network error thrown: \(err) \(msg)")
}
