//
//  User.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/26.
//
//

import PerfectLib
import PerfectHTTP
import DataBase
import MongoDB


public struct User {
    
    
    public  static func user()  -> RequestHandler {
        return { req, res in
            
            let action = req.urlVariables["action"] ?? "error"

            
            switch action {
                
            /// 用户我的section
            case HandlerType.User.tab.rawValue:
                
                res.appendBody(string: UserTabHandler.tab(req: req, res: res))

                
            default:
                print("default")
            }
            
            
            res.completed()
        }
        
    }
}
