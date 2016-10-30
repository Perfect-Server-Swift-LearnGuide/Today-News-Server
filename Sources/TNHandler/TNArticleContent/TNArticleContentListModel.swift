//
//  TNArticleContentListModel.swift
//  Today-News-Server
//
//  Created by sunquan on 2016/10/30.
//
//

import PerfectHTTP

public class TNArticleContentListModel {

    public var articles: [TNArticleContentModel] {
        get{
            self.articles.removeAll()
            for _ in 0..<10 {
                let model = TNArticleContentModel(title: "cccccc", content: "我是dddddddddd")
                self.articles.append(model)
            }
            return self.articles
        }
        set{}
    }
    

    init(category: String){
        articles = [TNArticleContentModel]()
    }
    
    public func list() -> String {
        return toString()
    }
    

    public func add(_ request: HTTPRequest) -> String {
        let new = TNArticleContentModel(
            title: request.param(name: "title")!,
            content: request.param(name: "content")!

        )
        articles.append(new)
        return toString()
    }
    
    public func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: String]
            let new = TNArticleContentModel(
                title: incoming["title"]!,
                content: incoming["content"]!
            )
            articles.append(new)
        } catch {
            return "ERROR"
        }
        return toString()
    }
    
    private func toString() -> String {
        var out = [String]()
        
        for m in self.articles {
            do {
                out.append(try m.jsonEncodedString())
            } catch {
                print(error)
            }
        }
        return "[\(out.joined(separator: ","))]"
    }
    
}
