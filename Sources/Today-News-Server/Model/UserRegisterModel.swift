//
//  UserRegisterModel.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/27.
//
//

import PerfectLib
//import Common
//import DataBase
import PerfectMongoDB

public class UserRegisterModel {
    
    /// dartabase
    var db: DB
    
    /// colllection
    var collection: MongoCollection?
    
    public init() {
        db = DB(db: "today_news").collection(name: "user")
        collection =  db.collection
    }
    
    public func register(data: [String: String]) -> String {

        let queryBson = BSON(map: data)
        
        var response = [String:Any]()
        if total(queryBson) > 0 {
            response["result"] = ["status" : 0, "msg" : "该手机号已注册"]
            return try! response.jsonEncodedString()
        }
        
        queryBson.append(key: "createtime" , string: try! formatDate(getNow(), format: "%Y/%m/%d %I:%M:%S"))
        queryBson.append(key: "isDelete", bool: false)
        let defaultData = [["dynamic" : 0], ["fans" : 0], ["visitor" : 0]]
        for dict in defaultData  {
            for (key, value) in dict {
                queryBson.append(key: key, int: value)
            }
        }
        
        let result: MongoResult = collection!.insert(document: queryBson)
        
        switch result {
        case .success:
            response["result"] = ["status" : 0, "msg" : "注册成功"]
            response["data"] = userInfo(queryBson)
        default:
            response["result"] = ["status" : 1, "msg" : "注册失败"]
            response["data"] = [String: Any]()
        }
        
        db.close()
        
        return try! response.jsonEncodedString()
    }
    
    func userInfo(_ bson: BSON) -> [String: Any] {
        let cursor = collection?.find(query: bson)
        
        var ary = [Any]()
        while let c = cursor?.next() {
            var user = [String: Any]()
            let data:[String: Any] = c.dict as [String : Any]
            let temp = data["_id"] as? [String : String]
            
            user["phone"] = data["phone"]
            user["createtime"] = data["createtime"]
            if let dict = temp {
                user["user_id"] = dict["$oid"]! as String
            } else {
                user["user_id"] = ""
            }
            ary.append(data)
        }

        guard let data = ary.first as? [String: Any] else {
            return [String: Any]()
        }
        
        return data
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

