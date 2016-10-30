//
//  TNHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// Handler
public enum TNHandlerType {
    /// 获取文章分类
    case articleCategory
    /// 获取不同分类新闻内容
    case articleContent
}

public struct TNHandler {
    
    /// 路由处理句柄
    public var handler: RequestHandler?
    
    public init() {
        
    }
    
    public init(handler: TNHandlerType) {
        
        switch handler {
        case .articleCategory:
            self.handler = articleCategoryHandler()
        case .articleContent:
            self.handler = articleContentHandler()

        }
        
    }

}


