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
        setupResponseHeader(response: response)
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

/// 设置响应头
private func setupResponseHeader(response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
}
