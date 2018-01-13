//
//  DB.swift
//  Today-News-Admin
//
//  Created by Mac on 17/7/14.
//
//

import PerfectLib
import PerfectMongoDB
import PerfectHTTP
import Config

open class DB {
    
    /// MongoClient
    open var client: MongoClient?
    
    /// MongoDatabase
    open var database: MongoDatabase?
    
    /// MongoCollection
    open var collection: MongoCollection?
    
    public init(db: String) {
        
        /// 通过默认的端口连接MongoDB
        self.client = try! MongoClient(uri: Database.today_news.connection + db)
        
        /// DataBase
        self.database = self.client.getDatabase(name: db)
      
    }
    
    public init() {}
    
    // init database 
    open func database(name: String) -> Self {
        /// 通过默认的端口连接MongoDB
        self.client = try! MongoClient(uri: Database.today_news.connection + name)
        /// DataBase
        self.database = self.client.getDatabase(name: name)
        return self
    }
    
    /// init collection
    open func collection(name: String) -> Self {
        self.collection = self.db.getCollection(name: Database.today_news.dbprefix + name)
        return self
    }
    
    /// close db connect
    open func close() {
        defer {
            self.collection!.close()
            self.database.close()
            self.client.close()
        }
    }
    
    /// database connect fail
    private func outputFail(client: MongoClient) {
        let status = client.serverStatus()
        switch status {
        case .error(let domain, let code, let message):
            print( "Error: \(domain) \(code) \(message)")
        case .replyDoc(_):
            print(true)
        default:
            print("Strange reply type \(status)")
        }
    }
}
