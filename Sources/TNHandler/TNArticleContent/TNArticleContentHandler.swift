//
//  TNArticleContentHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取对应分类文章
public func articleContentHandler() -> RequestHandler {
    
    return { request, response in

        let params = request.params()

        
        for param in params {
            if param.0 != "category" {
                response.completed()
                return
            }
            let article = TNArticleContentListModel(category: param.1)
            response.appendBody(string: article.list())
            
        }
        
        response.completed()
    }

}

