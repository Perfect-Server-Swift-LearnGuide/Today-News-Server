//
//  UerTabHandler.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/27.
//
//

import PerfectHTTP
//import Model

public struct UserTabHandler {
    
    /// 获取文章分类
    public static func tab(req: HTTPRequest, res: HTTPResponse) -> String {
        
        let tab = UserTabModel()
        return tab.userTabs()

    }

}

