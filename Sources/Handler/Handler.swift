//
//  Handler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP



public struct Handler {
    
    /// 路由处理句柄
    public var handler: RequestHandler?
    
    public init() {
        
    }
    
    public init(_ handler: HandlerType) {
        
        switch handler {
        case .articleCategory:
            self.handler = articleCategoryHandler()
            
        case .articleContent:
            self.handler = articleContentHandler()
            
        case .userTabs:
            self.handler = userTabHandler()
            
        default:
            print("default")
            
        }
        
    }

}


