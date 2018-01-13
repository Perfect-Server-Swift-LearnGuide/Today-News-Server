//
//  UserLoginHandler.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/28.
//
//

import PerfectHTTP

public struct UserLoginHandler {
    
    /// 登录
    public static func login(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var params = [String: String]()
        params["phone"] = req.param(name: "phone")
        params["pwd"] = req.param(name: "pwd")
        
        let login = UserLoginModel()
        return login.login(data: params)
        
    }
    
}
