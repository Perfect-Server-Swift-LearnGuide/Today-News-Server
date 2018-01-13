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
        
        let _ = db.database(name: "today_news").collection(name: "category")
    }
    
    public func categories() -> String {
        
        let queryBson = BSON()
        let cursor = db.collection?.find(query: queryBson)

        var results = [Any]()
        while let c = cursor?.next() {

            let data = c.dict
            results.append([
                "type" : data["type"] as? Int,
                "title"   : data["title"] as? String
            ])
        }
        var response = [String:Any]()
        if results.count > 0 {
            response["result"] = "success"
            response["data"] = results
        } else {
            response["result"] = "error"
        }
      

       db.close()
        
        return try! response.jsonEncodedString()
    }
    
    public func categoryTitle(type: Int) -> String {
        
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
