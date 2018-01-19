//
//  UserTab.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/27.
//
//

import PerfectLib
import PerfectMongoDB

public class UserTab: SK_Model {
    
    override public init() {
        super.init()
        let _ = db.database(name: "today_news").collection(name: "tabs")
    }
    
    public func userTabs() -> String{
        
        let queryBson = BSON()
        let cursor = db.collection?.find(query: queryBson)
        
        var results = [Any]()
        while let c = cursor?.next() {
            results.append(c.dict)
        }
        var response = [String:Any]()
        if results.count > 0 {
            response["result"] = "success"
            response["data"] = results.first
        } else {
            response["result"] = "error"
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }
    
}
