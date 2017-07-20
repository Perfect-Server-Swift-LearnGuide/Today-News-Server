//
//  ArticleCategoryHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取文章分类
public func articleCategoryHandler() -> RequestHandler {
    
    return { request, response in

        let db = ArticleCategoryModel()
        response.appendBody(string: db.categories())
        
        response.completed()
    }

}

