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
