//
//  TNArticleCategoryHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取文章分类
public func articleCategoryHandler() -> RequestHandler {
    
    return { request, response in
        setupResponseHeader(response: response)
        let articleCategoryModel = TNArticleCategoryModel()
        response.appendBody(string: articleCategoryModel.list())
        response.completed()
    }

}

/// 设置响应头
private func setupResponseHeader(response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
}
