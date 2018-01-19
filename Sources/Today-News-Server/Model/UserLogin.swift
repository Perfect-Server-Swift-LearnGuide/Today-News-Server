//
//  UserLogin.swift
//  Today-News-Server
//
//  Created by Mac on 17/8/28.
//
//

import PerfectLib
import PerfectMongoDB

public class UserLogin: SK_Model {

    
    override public init() {
        super.init()
        let _ = db.database(name: "today_news").collection(name: "user")
    }
    
    public func login(data: [String: String]) -> String{
        
        let queryBson = BSON(map: data)
        
        var response = [String:Any]()
        if total(queryBson) <= 0 {
            response["result"] = ["status" : 1, "msg" : "用户名或密码不正确"]
            response["data"] = [String: Any]()
            return try! response.jsonEncodedString()
        } else {
            response["result"] = ["status" : 0, "msg" : "登录成功"]
            response["data"] = userInfo(queryBson)
        }

        db.close()
        
        return try! response.jsonEncodedString()
    }
    
    func userInfo(_ bson: BSON) -> [String: Any] {
        let cursor = db.collection?.find(query: bson)
        
        var results = [Any]()
        while let c = cursor?.next() {
            var user = [String: Any]()
            let data:[String: Any] = c.dict as [String : Any]
            let temp = data["_id"] as? [String : String]
            user["phone"] = data["phone"]
            user["createtime"] = data["createtime"]
            user["dynamic"] = data["dynamic"]
            user["fans"] = data["fans"]
            user["visitor"] = data["visitor"]
            if let dict = temp {

                user["user_id"] = dict["$oid"]! as String
            } else {
                user["user_id"] = ""
            }
            results.append(user)
        }
        
        guard let data = results.first as? [String: Any] else {
            return [String: Any]()
        }
        
        return data
    }
    
    /// get total num
    public func total(_ bson: BSON) -> Int {
        let result: MongoResult = db.collection!.count(query: bson)
        switch result {
        case .replyInt(let total):
            return total
        default:
            return 0
        }
    }
}
