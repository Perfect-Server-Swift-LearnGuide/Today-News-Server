//
//  Article.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/26.
//
//

import PerfectLib
import PerfectHTTP
//import DataBase
import PerfectMongoDB
//import Common


public struct Article {
    
    
    public  static func article()  -> RequestHandler {
        return { req, res in
            

            let action = req.urlVariables["action"] ?? "error"
            
            
            switch action {
                
            /// 分类
            case Server.Route.Article.category.rawValue:
                res.appendBody(string: ArticleCategoryHandler.category(req: req, res: res))

            /// 对应分类文章
            case Server.Route.Article.content.rawValue:
                res.appendBody(string: ArticleContentHandler.content(req: req, res: res))
                
            /// 文章详情
            case Server.Route.Article.detail.rawValue:
                res.appendBody(string: ArticleDetailHandler.detail(req: req, res: res))
            
            default:
                print("default")
            }
            
            
            res.completed()
        }
        
    }
}

