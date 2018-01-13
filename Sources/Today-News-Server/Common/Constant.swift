//
//  Constant.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//



public enum Server {
    

    /// 路由
    public enum Route: String {
        
        /// 根Url
        case baseUrl =  "Api/"
        
        /// 文章
        public enum Article: String {
            
            /// 分类
            case category
            
            /// 分类对应内容
            case content
            
            /// 详情
            case detail
            
        }
        
        /// 用户
        public enum User: String {
            
            /// 注册
            case register
            
            /// 登录
            case login
            
            /// 我的界面section
            case tab
        }
    }
    
    /// 目录
    public enum Dir: String {
        
        case dir
        
    }
    
    /// 状态码
    public enum ErrorStatus: Int {
       case ok
    }
    
}
