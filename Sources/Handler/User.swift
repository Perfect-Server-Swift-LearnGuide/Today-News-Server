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
import PerfectMongoDB
import Common


public struct User {
    
    
    public  static func user()  -> RequestHandler {
        return { req, res in
            
            let action = req.urlVariables["action"] ?? "error"

            
            switch action {
                
            /// 用户我的section
            case Server.Route.User.tab.rawValue:
                
                res.appendBody(string: UserTabHandler.tab(req: req, res: res))

            case Server.Route.User.register.rawValue:
                
                 res.appendBody(string: UserRegisterHandler.register(req: req, res: res))
                
            case Server.Route.User.login.rawValue:
                
                res.appendBody(string: UserLoginHandler.login(req: req, res: res))
                
            default:
                print("default")
            }
            
            
            res.completed()
        }
        
    }
}
