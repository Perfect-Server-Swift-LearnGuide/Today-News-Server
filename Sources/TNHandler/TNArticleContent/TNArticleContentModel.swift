//
//  TNArticleContentModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib

public class TNArticleContentModel : JSONConvertibleObject {
    public var title = ""
    public var content = ""
    public var category = "" 
    
    static let registerName = "articleContentModel"
    
    public init(title: String, content: String) {
        self.title	= title
        self.content	= content
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        self.title		= getJSONValue(named: "title", from: values, defaultValue: "")
        self.content		= getJSONValue(named: "content", from: values, defaultValue: "")
    }
    override public func getJSONValues() -> [String : Any] {
        return [
            "title" : title,
            "content" : content,
        ]
    }
}

