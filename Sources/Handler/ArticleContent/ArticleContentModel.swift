//
//  ArticleContentModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib
import Common
import MongoDB
import DataBase

public class ArticleContentModel {
    
    public func content(type: Int) -> String {
        let db = DB(db: "today_news").collection(name: "article")
        let collection: MongoCollection? = db.collection
        
        let queryBson = BSON()
        queryBson.append(key: "type", int: type)
        let fields = BSON()
        fields.append(key: "title", int: 1)
        fields.append(key: "createtime", int: 1)
        fields.append(key: "type", int: 1)

        let cursor = collection?.find(query: queryBson, fields: fields)

        var ary = [Any]()
        while let c = cursor?.next() {
            
            let data = c.dict
            var thisPost = [String: Any]()
            
            thisPost["type"] = data["type"] as? Int
            thisPost["createtime"] = data["createtime"] as? String
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

    
}

