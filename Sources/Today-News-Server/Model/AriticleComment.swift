//
//  AriticleComment.swift
//  Today-News-Server
//
//  Created by Mac on 17/7/23.
//
//

import PerfectLib
import PerfectMongoDB


public class ArticleComment: SK_Model {

    
    public init() {
        let _  = DB(db: "today_news").collection(name: "comment")
    }
    
    public func comment_count(article_bson: BSON) -> Int {
        let result: MongoResult = db.collection!.count(query: article_bson)
        db.close()
        switch result {
        case .replyInt(let total):
            return total
        default:
            return 0
        }
        
    }

}
