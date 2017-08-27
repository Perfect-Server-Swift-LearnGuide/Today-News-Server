//
//  UserRegisterModel.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/27.
//
//

import PerfectLib
import Common
import MongoDB
import DataBase


public class UserRegisterModel {
    
    /// dartabase
    var db: DB
    
    /// colllection
    var collection: MongoCollection?
    
    public init() {
        db = DB(db: "today_news").collection(name: "user")
        collection =  db.collection
    }
    
    public func register(data: [String: String]) -> String{

        let queryBson = BSON(map: data)
        
        var response = [String:Any]()
        if total(queryBson) > 0 {
            response["result"] = ["status" : 0, "msg" : "该手机号已注册"]
            return try! response.jsonEncodedString()
        }
        
        queryBson.append(key: "createtime" , string: try! formatDate(getNow(), format: "%Y/%m/%d %I:%M:%S"))
        queryBson.append(key: "isDelete", bool: false)
        
        let result: MongoResult = collection!.insert(document: queryBson)
        
        switch result {
        case .success:
            response["result"] = ["status" : 0, "msg" : "注册成功"]
        default:
            response["result"] = ["status" : 1, "msg" : "注册失败"]
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }
    
    /// get total num
    public func total(_ bson: BSON) -> Int {
        let result: MongoResult = collection!.count(query: bson)
        switch result {
        case .replyInt(let total):
            return total
        default:
            return 0
        }
    }
}

