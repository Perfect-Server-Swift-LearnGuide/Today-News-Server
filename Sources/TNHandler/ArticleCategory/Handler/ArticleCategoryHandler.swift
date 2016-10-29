//
//  ArticleCategory.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取文章分类
func articleCategoryHandler(request: HTTPRequest, response: HTTPResponse) {
    
    let articleCategoryModel = TNArticleCategoryModel()
    response.appendBody(string: articleCategoryModel.list())
    
    response.completed()
}
