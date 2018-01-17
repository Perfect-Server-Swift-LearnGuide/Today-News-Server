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

struct Filter1: HTTPRequestFilter {
    func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
       print("method: \(request.method)")
        print("path: \(request.path)")
         print("queryParams: \(request.queryParams)")
         print("headers: \(request.headers)")
         print("postParams: \(request.postParams)")
        callback(.continue(request, response))
    }
}

public struct App {
    /// 服务器
    public var server = HTTPServer()
    
    public init() {
    
        let responseFilters: [(HTTPResponseFilter, HTTPFilterPriority)] = [
            (ResponseFilter(), HTTPFilterPriority.high)
        ]
        let requestFilters: [(HTTPRequestFilter,HTTPFilterPriority)] = [
            (Filter1(), HTTPFilterPriority.high)
        ]
        server.setRequestFilters(requestFilters)
        /// t添加响应过滤器
        server.setResponseFilters(responseFilters)
        
        /// 创建路由
        let routes = Route().routes
        
        /// 为服务器注册路由
        server.addRoutes(routes)
        
        /// 监听端口
        server.serverPort = UInt16(app.hostport)
        
        /// 设置文档根目录
        server.documentRoot = app.hostroot

    }


}
