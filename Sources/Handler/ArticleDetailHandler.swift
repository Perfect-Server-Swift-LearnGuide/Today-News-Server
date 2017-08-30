//
//  ArticleDetailHandler.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/28.
//
//

import PerfectHTTP
import Model

public struct ArticleDetailHandler {
    
    /// 获取文章详情
    public static func detail(req: HTTPRequest, res: HTTPResponse) -> String {
        
        let detail = ArticleDetailModel()
        return detail.detail(req.param(name: "article_id")!)
        
    }
    
}
