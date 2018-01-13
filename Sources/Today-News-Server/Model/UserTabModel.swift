//
//  UserTabModel.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/27.
//
//

import PerfectLib
import Common
import DataBase
import PerfectMongoDB

public class UserTabModel {
    
    public init() {}
    
    public func userTabs() -> String{
        let db = DB(db: "today_news").collection(name: "tabs")
        let collection: MongoCollection? = db.collection
        
        let queryBson = BSON()
        let cursor = collection?.find(query: queryBson)
        
        var ary = [Any]()
        while let c = cursor?.next() {
            ary.append(c.dict)
        }
        var response = [String:Any]()
        if ary.count > 0 {
            response["result"] = "success"
            response["data"] = ary.first
        } else {
            response["result"] = "error"
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }
    
}
