//
//  UerTabHandler.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/27.
//
//

import PerfectHTTP

/// 获取文章分类
public func userTabHandler() -> RequestHandler {
    
    return { request, response in
        
        let db = UserTabModel()
    
        response.appendBody(string: db.userTabs())
        
        response.completed()
    }
    
}
