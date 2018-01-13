//
//  Route.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP
//import Common
//import Handler

public struct Route {
    
    /// 路由
    public var routes = Routes()
    
    public init() {

        /// 设置主路由
        var baseRoutes = Routes(baseUri: Server.Route.baseUrl.rawValue)
        
        /// 文章
        let article = Article.article()
        
        /// 用户
        let user = User.user()
        
        /// 文章
        baseRoutes.add(method: .get, uri: "article/{action}", handler: article)
        
        /// 用户
        baseRoutes.add(method: .get, uri: "user/{action}", handler: user)
        
        /// 注册到服务器主路由表上
        self.routes.add(baseRoutes)
    }

}


