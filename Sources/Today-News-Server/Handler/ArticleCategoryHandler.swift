//
//  ArticleCategoryHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP
//import Model

public struct ArticleCategoryHandler {
    
    /// 获取文章分类
    public static func category(req: HTTPRequest, res: HTTPResponse) -> String {

        let category = ArticleCategoryModel()
        return category.categories()

    }
    
}



