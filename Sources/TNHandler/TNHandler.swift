//
//  TNHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

enum TNHandler {
    /// 获取文章分类
    case articleCategoryHandler
    /// 获取不同分类新闻内容
    case articleContentHandler
}

func makeHandler(handler: TNHandler) -> RequestHandler{
    
    switch handler {
    case .articleCategoryHandler:
        return { request, response in
            setupResponseHeader(response: response)
            articleCategoryHandler(request: request, response: response)
        }
    case .articleContentHandler:
        return { request, response in
            setupResponseHeader(response: response)
            articleContentHandler(request: request, response: response)
        }

    }
}

/// 设置响应头
func setupResponseHeader(response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
}
