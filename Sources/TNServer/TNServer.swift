//
//  TNServer.swift
//  Today-News-Server
//
//  Created by sunquan on 2016/10/30.
//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import TNRoute

public struct TNServer {
    /// 服务器
    public var server = HTTPServer()
    
    public init() {
    
        /// 创建路由
        let routes = TNRoute().routes
        
        /// 为服务器注册路由
        server.addRoutes(routes)
        
        /// 监听端口
        server.serverPort = 8181
        
        /// 设置文档根目录
        server.documentRoot = "./webroot"
    }

}
