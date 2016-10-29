//
//  TNRoute.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

func makeRoutes() -> Routes {
    /// 创建路由
    var routes = Routes()

    /// 设置主路由
    var baseRoutes = Routes(baseUri: TNServer.TNApi.baseUrl.rawValue)
    
    /// 添加加文章分类路由
    baseRoutes.add(routes: setupArticleCategory())
    /// 添加加文章内容路由
    baseRoutes.add(routes: setupArticleContent())
    
    
    /// 注册到服务器主路由表上
    routes.add(routes: baseRoutes)
    
    return routes
}

/// 初始化设置文章分类路由
func setupArticleCategory() -> Routes{
    /// 文章分类
    var articleCategory = Routes()
    /// 注册路由句柄
    articleCategory.add(method: .get, uri: TNServer.TNApi.articleCategory.rawValue, handler: makeHandler(handler: .articleCategoryHandler))
    return articleCategory
}

/// 初始化设置对应分类文章内容路由
func setupArticleContent() -> Routes{
    /// 文章内容
    var articleContent = Routes()
    /// 注册路由句柄
    articleContent.add(method: .post, uri: TNServer.TNApi.articleContent.rawValue, handler: makeHandler(handler: .articleContentHandler))
    return articleContent
}
