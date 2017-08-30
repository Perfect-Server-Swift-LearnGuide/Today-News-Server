//
//  UserRegisterHandler.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/27.
//
//

import PerfectHTTP
import Model
import Foundation

public struct UserRegisterHandler {
    
    /// 注册
    public static func register(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var params = [String: String]()
        params["phone"] = req.param(name: "phone")
        let pwd = req.param(name: "phone")
        let index = pwd?.index(pwd!.endIndex, offsetBy: -6)
        params["pwd"] = pwd?.substring(from: index!)

        let register = UserRegisterModel()
        return register.register(data: params)
        
    }
    
}

