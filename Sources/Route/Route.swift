//
//  Route.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP
import Common
import Handler

public struct Route {
    /// 路由
    public var routes = Routes()
    
    public init() {

        /// 设置主路由
        var baseRoutes = Routes(baseUri: Server.Api.baseUrl.rawValue)
        
        /// 文章分类
        baseRoutes.add(method: .get, uri: Server.Api.articleCategory.rawValue, handler: Handler(.articleCategory).handler!)
        
        /// 文章内容
        baseRoutes.add(method: .get, uri: Server.Api.articleContent.rawValue, handler: Handler(.articleContent).handler!)
        
        /// 注册到服务器主路由表上
        self.routes.add(baseRoutes)
    }

}


