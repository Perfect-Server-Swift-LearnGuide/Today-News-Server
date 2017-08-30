//
//  ArticleContentHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP
import Model


public struct ArticleContentHandler {
    
    /// 获取对应分类文章
    public static func content(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var requestType = 1
        if let type = req.param(name: "type") {
            requestType = Int(type)!
        }
        var requestPage = 1
        if let page = req.param(name: "page") {
            requestPage = Int(page)!
        }
        
        let content = ArticleContentModel()
        return content.content(type: requestType, page: requestPage)
  
    }
    
}



