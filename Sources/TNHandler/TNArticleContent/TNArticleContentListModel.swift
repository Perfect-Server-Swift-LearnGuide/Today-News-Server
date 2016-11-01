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
            var array = [TNArticleContentModel]()
            for _ in 0..<10 {
                let model = TNArticleContentModel(title: "cccccc", content: "我是dddddddddd")
                array.append(model)
            }
            return array
        }
        set{}
    }
    

    init(category: String){
        articles = [TNArticleContentModel]()
    }
    

    // MARK: - 添加方法
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
    
    // MARK: - 辅助方法
    public func list() -> String {
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
