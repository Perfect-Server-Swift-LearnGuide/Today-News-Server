//
//  Route.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

public struct Route {
    
    /// 路由
    public var routes = Routes()
    
    public init() {

        /// 设置主路由
        var baseRoutes = Routes(baseUri: Server.Route.baseUrl.rawValue)
        
       /// 文章
        baseRoutes.add(method: .get, uri: "article/{action}", handler: ArticleController().index())

        /// 用户
        baseRoutes.add(method: .get, uri: "user/{action}", handler: UserController().index())
        
        /// 注册到服务器主路由表上
        self.routes.add(baseRoutes)
    }

}


