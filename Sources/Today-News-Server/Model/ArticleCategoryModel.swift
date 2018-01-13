//
//  ArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib

import PerfectMongoDB

public class ArticleCategoryModel: SK_Model {
    
    override public init() {
        super.init()
        
        db.database(name: "today_news").collection(name: "category")
    }
    
    public func categories() -> String {
        
        let queryBson = BSON()
        let cursor = db.collection?.find(query: queryBson)

        var ary = [Any]()
        while let c = cursor?.next() {

            let data = c.dict
            var thisPost = [String: Any]()
            
            thisPost["type"] = data["type"] as? Int
            thisPost["title"] = data["title"] as? String
            ary.append(thisPost)
        }
        var response = [String:Any]()
        if ary.count > 0 {
            response["result"] = "success"
            response["data"] = ary
        } else {
            response["result"] = "error"
        }
      

       db.close()
        
        return try! response.jsonEncodedString()
    }
    
    public func categoryTitle(type: Int) -> String {
        
        /// 获取该集合下所有的信息
        let queryBson = BSON()
        queryBson.append(key: "type", int: type)
        let cursor = db.collection?.find(query: queryBson)
        var title = ""
        while let c = cursor?.next() {
            let data = c.dict
            title = data["title"] as! String
        }
        return title
    }
    
}
