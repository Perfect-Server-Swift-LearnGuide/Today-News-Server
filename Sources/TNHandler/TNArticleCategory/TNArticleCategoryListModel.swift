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
            var array = [TNArticleCategoryModel]()
            for _ in 0..<10 {
                let model = TNArticleCategoryModel(category: "news_hot", web_url: "", flags: 0, name: "热点", tip_new: 0, default_add: 0, concern_id: "", type: 0, icon_url: "")
                array.append(model)
            }
            return array
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
            tip_new : Int(request.param(name: "tip_new")!)!,
            default_add : Int(request.param(name: "default_add")!)!,
            concern_id : request.param(name: "concern_id")!,
            type : Int(request.param(name: "type")!)!,
            icon_url : request.param(name: "icon_url")!
        )
        categories.append(new)
        return toString()
    }
    
    public func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: String]
            let new = TNArticleCategoryModel(
                
                category : incoming[ "category"]!,
                web_url : incoming[ "web_url"]!,
                flags : Int(incoming[ "flags"]!)!,
                name : incoming[ "name"]!,
                tip_new : Int(incoming[ "tip_new"]!)!,
                default_add : Int(incoming[ "default_add"]!)!,
                concern_id : incoming[ "concern_id"]!,
                type : Int(incoming[ "type"]!)!,
                icon_url : incoming[ "icon_url"]!
                
            )
            categories.append(new)
        } catch {
            return "ERROR"
        }
        return toString()
    }
    
    private func toString() -> String {
        var out = [String]()
        
        for m in self.categories {
            do {
                out.append(try m.jsonEncodedString())
            } catch {
                print(error)
            }
        }
        return "[\(out.joined(separator: ","))]"
    }
    
}
