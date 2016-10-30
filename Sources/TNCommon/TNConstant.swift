//
//  TNConstant.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//



public enum TNServer {
    
    /// Api
    public enum TNApi: String {
        /// 根Url
        case baseUrl =  "today_news/"
        /// 文章分类
        case articleCategory =  "article/category"
        /// 分类对于文章
        case articleContent = "article/content"
    }
}
