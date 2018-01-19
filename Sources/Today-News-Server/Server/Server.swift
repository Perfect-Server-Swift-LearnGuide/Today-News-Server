//
//  Server.swift
//  Today-News-Server
//
//  Created by sunquan on 2016/10/30.
//
//

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


public struct App {
    /// 服务器
    public var server = HTTPServer()
    
    public init() {

        /// 添加过滤器
        server.setRequestFilters(SK_Dispatch.requestFilters)
        server.setResponseFilters(SK_Dispatch.responseFilters)
        
        /// 监听端口
        server.serverPort = UInt16(app.hostport)
        
        /// 设置文档根目录
        server.documentRoot = app.hostroot

    }


}
