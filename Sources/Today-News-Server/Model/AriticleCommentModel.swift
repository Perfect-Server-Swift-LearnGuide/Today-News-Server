//
//  AriticleCommentModel.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/23.
//
//

import PerfectLib
import Common
import PerfectMongoDB
import DataBase


public class ArticleCommentModel {
    
    /// dartabase
    var db: DB
    
    /// colllection
    var collection: MongoCollection?
    
    public init() {
        db = DB(db: "today_news").collection(name: "comment")
        collection =  db.collection
    }
    
    public func comment_count(article_bson: BSON) -> Int {
        let result: MongoResult = collection!.count(query: article_bson)
        db.close()
        switch result {
        case .replyInt(let total):
            return total
        default:
            return 0
        }
        
    }

}
