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

        var requestType = 1
        if let type = request.param(name: "type") {
            requestType = Int(type)!
        }
        var requestPage = 1
        if let page = request.param(name: "page") {
            requestPage = Int(page)!
        }
        
        let db = ArticleContentModel()
        response.appendBody(string: db.content(type: requestType, page: requestPage))

        
        response.completed()
    }

}

