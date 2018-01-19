//
//  UserController.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/26.
//
//

import PerfectLib
import PerfectHTTP
import PerfectMongoDB


public class UserController: SK_Controller {
    
    override public init() {
        
    }
    
    public func index()  -> RequestHandler {
        return { req, res in
            
            let action = req.urlVariables["action"] ?? "error"

            
            switch action {
                
            /// 用户我的section
            case Server.Route.User.tab.rawValue:
                
                res.appendBody(string: self.tab(req: req, res: res))
                
            case Server.Route.User.register.rawValue:
                
                 res.appendBody(string: self.register(req: req, res: res))
                
            case Server.Route.User.login.rawValue:
                
                res.appendBody(string: self.login(req: req, res: res))
                
            default:
                print("default")
            }
            
            
            res.completed()
        }
        
    }
    
    /// 登录
    public func login(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var params = [String: String]()
        params["phone"] = req.param(name: "phone")
        params["pwd"] = req.param(name: "pwd")
        
        let login = UserLogin()
        return login.login(data: params)
        
    }
    
    /// 注册
    public func register(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var params = [String: String]()
        params["phone"] = req.param(name: "phone")
        let pwd = req.param(name: "phone")
        let index = pwd?.index(pwd!.endIndex, offsetBy: -6)
        params["pwd"] = pwd?.substring(from: index!)
        
        let register = UserRegister()
        return register.register(data: params)
        
    }
    
    /// 获取文章分类
    public func tab(req: HTTPRequest, res: HTTPResponse) -> String {
        
        let tab = UserTab()
        return tab.userTabs()
        
    }
}
