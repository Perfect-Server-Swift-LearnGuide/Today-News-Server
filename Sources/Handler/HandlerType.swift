//
//  HandlerType.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/20.
//
//


/// Handler
public enum HandlerType: String {

    
    /// 根Url
    case baseUrl =  "Api/"
    
    /// 文章
    enum Article:String {
        
        /// 分类
        case category
        
        /// 分类对应内容
        case content
        
    }
    
    /// 用户
    enum User:String {
        
        /// 我的界面section
        case tab
    }


}
