//
//  TNRoute.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP
import TNCommon
import TNHandler

public struct TNRoute {
    /// 路由
    public var routes = Routes()
    
    public init() {

        /// 设置主路由
        var baseRoutes = Routes(baseUri: TNServer.TNApi.baseUrl.rawValue)
        
        /// 添加加文章分类路由
        baseRoutes.add(routes: setupArticleCategory())
        /// 添加加文章内容路由
        baseRoutes.add(routes: setupArticleContent())
        
        /// 注册到服务器主路由表上
        self.routes.add(routes: baseRoutes)
    }

    /// 初始化设置文章分类路由
    private  func setupArticleCategory() -> Routes{
        /// 文章分类
        var articleCategory = Routes()
        /// 注册路由句柄
        articleCategory.add(method: .get, uri: TNServer.TNApi.articleCategory.rawValue, handler: TNHandler(handler: .articleCategory).handler!)
        return articleCategory
    }
    
    /// 初始化设置对应分类文章内容路由
    private  func setupArticleContent() -> Routes{
        /// 文章内容
        var articleContent = Routes()
        /// 注册路由句柄
        articleContent.add(method: .post, uri: TNServer.TNApi.articleContent.rawValue, handler: TNHandler(handler: .articleContent).handler!)
        return articleContent
    }
}


