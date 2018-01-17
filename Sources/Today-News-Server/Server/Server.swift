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


struct ResponseFilter: HTTPResponseFilter {
    func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        /// 设置响应头
        response.setHeader(.contentType, value: "application/json")
        callback(.done)
    }
    func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
        callback(.done)
    }
}



public struct App {
    /// 服务器
    public var server = HTTPServer()
    
    public init() {
    
        let responseFilters: [(HTTPResponseFilter, HTTPFilterPriority)] = [
            (ResponseFilter(), HTTPFilterPriority.high)
        ]

        let dispatch = SK_Dispatch()
        server.setRequestFilters(dispatch.requestFilters)
        /// t添加响应过滤器
        server.setResponseFilters(responseFilters)
        
        /// 创建路由
        let routes = Route().routes
        
        /// 为服务器注册路由
        server.addRoutes(dispatch.routes)
        
        /// 监听端口
        server.serverPort = UInt16(app.hostport)
        
        /// 设置文档根目录
        server.documentRoot = app.hostroot

    }


}
