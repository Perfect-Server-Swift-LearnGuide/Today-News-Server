//
//  ArticleContentHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取对应分类文章
public func articleContentHandler() -> RequestHandler {
    
    return { request, response in

        var type = 1
        if let page = request.param(name: "type") {
            type = Int(page)!
        }
        
        
        let db = ArticleContentModel()
        response.appendBody(string: db.content(type: type))

        
        response.completed()
    }

}

