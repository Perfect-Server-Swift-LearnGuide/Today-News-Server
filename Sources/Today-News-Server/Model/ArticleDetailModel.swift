//
//  ArticleDetailModel.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/28.
//
//

import PerfectLib
import Common
import DataBase
import Config
import PerfectMongoDB

public class ArticleDetailModel {
    
    /// dartabase
    var db: DB
    
    /// colllection
    var collection: MongoCollection?
    
    public init() {
        db = DB(db: "today_news").collection(name: "article")
        collection =  db.collection
    }
    
    public func detail(_ id: String) -> String {
        let queryBson = BSON()
        queryBson.append(key: "_id", oid: BSON.OID(id))
        queryBson.append(key: "isDelete", bool: false)

        let cursor = collection?.find(query: queryBson)
        
        var ary = [Any]()
        while let c = cursor?.next() {
            var data:[String: Any] = c.dict as [String : Any]
            let bson = BSON()
            let temp = data["_id"] as? [String : String]
           
            if let dict = temp {
                bson.append(key: "article_id", oid: BSON.OID(dict["$oid"]! as String))
                 data["article_id"] = dict["$oid"]! as String
            } else {
                bson.append(key: "article_id", oid: BSON.OID(""))
                data["article_id"] = ""
            }
            
            var thumbnails = [String]()
            if let imgArr = data["thumbnails"] as? [String] {
                for img in imgArr {
                    var thumbnail = img
                    thumbnail.removeSubrange(thumbnail.startIndex..<thumbnail.index(after: thumbnail.startIndex))
                    thumbnails.append(app.imghost + thumbnail)
                }
            }
            
            if let type = data["type"] as? Int {
                data["category"] = categoryTitle(type: type)
            }
            
            
            data["thumbnails"] = thumbnails
            
            data["comment_count"] = ArticleCommentModel().comment_count(article_bson:bson)
            ary.append(data)
        }
        var response = [String:Any]()
        if ary.count > 0 {
            response["result"] = "success"
            response["data"] = ary.first as! [String: Any]
        } else {
            response["result"] = "error"
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }
    
    public func categoryTitle(type: Int) -> String {
        db = DB(db: "today_news").collection(name: "category")
        collection =  db.collection
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

