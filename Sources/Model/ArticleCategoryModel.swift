//
//  ArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib
import Common
import DataBase
import PerfectMongoDB
import Core

public class ArticleCategoryModel: SK_Model {
    
//    /// dartabase
//    var db: DB
    
    /// colllection
    var collection: MongoCollection?
    
    public init() {
//        db = DB(db: "today_news").collection(name: "category")
//        collection =  db.collection
        collection = db.database("today_news").collection("category")
    }
    
    public func categories() -> String {
        
        let queryBson = BSON()
        let cursor = collection?.find(query: queryBson)
        
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
        let cursor = collection?.find(query: queryBson)
        var title = ""
        while let c = cursor?.next() {
            let data = c.dict
            title = data["title"] as! String
        }
        return title
    }
    
}
