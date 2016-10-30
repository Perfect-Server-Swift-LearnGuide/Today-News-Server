//
//  TNArticleCategoryListModel.swift
//  Today-News-Server
//
//  Created by sunquan on 2016/10/30.
//
//

import PerfectHTTP

public class TNArticleCategoryListModel {
    public var categories: [TNArticleCategoryModel] {
        get{
            self.categories.removeAll()
            for _ in 0..<10 {
                let model = TNArticleCategoryModel(category: "news_hot", web_url: "", flags: 0, name: "热点", tip_new: 0, default_add: 0, concern_id: "", type: 0, icon_url: "")
                self.categories.append(model)
            }
            return self.categories
        }
        set{}
    }
    
    
    init(){
        categories = [TNArticleCategoryModel]()
    }
    
    public func list() -> String {
        return toString()
    }
    
    
    public func add(_ request: HTTPRequest) -> String {
        let new = TNArticleCategoryModel(
            category : request.param(name: "category")!,
            web_url : request.param(name: "web_url")!,
            flags : Int(request.param(name: "flags")!)!,
            name : request.param(name: "name")!,
            tip_new : request.param(name: "tip_new")!,
            default_add : request.param(name: "default_add")!,
            concern_id : request.param(name: "concern_id")!,
            type : request.param(name: "type")!,
            icon_url : request.param(name: "icon_url")!
        )
        categories.append(new)
        return toString()
    }
    
    public func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: String]
            let new = TNArticleCategoryModel(
                title: incoming["title"]!,
                content: incoming["content"]!
            )
            categories.append(new)
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
