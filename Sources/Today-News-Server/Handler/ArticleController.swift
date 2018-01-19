//
//  Article.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/26.
//
//

import PerfectLib
import PerfectHTTP
import PerfectMongoDB


public class ArticleController: SK_Controller {
    
    override public init() {
        
    }
    
    public func index()  -> RequestHandler {
        return { req, res in
            
            let action = req.urlVariables["action"] ?? "error"
            
            switch action {
                
            /// 分类
            case Server.Route.Article.category.rawValue:
                res.appendBody(string: self.category(req: req, res: res))

            /// 对应分类文章
            case Server.Route.Article.content.rawValue:
                res.appendBody(string: self.content(req: req, res: res))
                
            /// 文章详情
            case Server.Route.Article.detail.rawValue:
                res.appendBody(string: self.detail(req: req, res: res))
            
            default:
                print("default")
            }
            
            res.completed()
        }
        
    }
    
    /// 获取文章分类
    public func category(req: HTTPRequest, res: HTTPResponse) -> String {
        let category = ArticleCategory()
        return category.categories()
    }
    
    /// 获取对应分类文章
    public func content(req: HTTPRequest, res: HTTPResponse) -> String {
        
        var requestType = 1
        if let type = req.param(name: "type") {
            requestType = Int(type)!
        }
        var requestPage = 1
        if let page = req.param(name: "page") {
            requestPage = Int(page)!
        }
        
        let content = ArticleContent()
        return content.content(type: requestType, page: requestPage)
    }
    
    /// 获取文章详情
    public func detail(req: HTTPRequest, res: HTTPResponse) -> String {
        
        let detail = ArticleDetail()
        return detail.detail(req.param(name: "article_id")!)
    }
}

