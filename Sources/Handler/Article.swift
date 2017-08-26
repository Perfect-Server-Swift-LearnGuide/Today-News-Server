//
//  Article.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/26.
//
//

import PerfectLib
import PerfectHTTP
import DataBase
import MongoDB


public struct Article {
    
    
    public  static func article()  -> RequestHandler {
        return { req, res in
            

            let action = req.urlVariables["action"] ?? "error"
            
            
            switch action {
                
            /// 分类
            case HandlerType.Article.category.rawValue:
                res.appendBody(string: ArticleCategoryHandler.category(req: req, res: res))

            /// 对应分类文章
            case HandlerType.Article.content.rawValue:
                res.appendBody(string: ArticleContentHandler.content(req: req, res: res))
            
            default:
                print("default")
            }
            
            
            res.completed()
        }
        
    }
}

