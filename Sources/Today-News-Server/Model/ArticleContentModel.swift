//
//  ArticleContentModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib
import PerfectMongoDB

public class ArticleContentModel: SK_Model {
    

    /// dataList
    public var dataList = [Any]()
    
    override public init() {
        super.init()
        db.database(name: "today_news").collection(name: "article")
    }
    
    public func content(type: Int, page: Int) -> String {
        
        let queryBson = BSON()
        queryBson.append(key: "type", int: type)
        queryBson.append(key: "isDelete", bool: false)
        let fields = BSON()
        fields.append(key: "title", int: 1)
        fields.append(key: "createtime", int: 1)
        fields.append(key: "type", int: 1)
        fields.append(key: "source", int: 1)
        fields.append(key: "thumbnails", int: 1)
        let limit = 6
        let skip = limit * (page - 1)
        let cursor = db.collection?.find(query: queryBson, fields: fields, flags: MongoQueryFlag.none, skip: skip, limit: limit, batchSize: 0)

        var results = [Any]()
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

            data["thumbnails"] = thumbnails
            
            data["comment_count"] = ArticleCommentModel().comment_count(article_bson:bson)
            results.append(data)
        }
        
        var response = [String:Any]()
        if results.count > 0 {
            response["result"] = "success"
            response["total"] = total(query: queryBson)
            response["data"] = results
        } else {
            response["result"] = "error"
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }

    
    /// get total num
    public func total(query: BSON) -> Int {
        let result: MongoResult = db.collection!.count(query: query)
        switch result {
        case .replyInt(let total):
            return total
        default:
            return 0
        }
    }
    
}

