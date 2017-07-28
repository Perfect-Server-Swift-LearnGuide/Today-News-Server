//
//  HandlerType.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/20.
//
//


/// Handler
public enum HandlerType {
    /// 获取文章分类
    case articleCategory
    
    /// 获取不同分类新闻内容
    case articleContent
    
    /// 获取用户tabs
    case userTabs
}
