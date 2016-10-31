//
//  TNArticleContentModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib
import TNCommon

public class TNArticleContentModel : JSONConvertibleObject, TNJSONConvertibleProtocol {
    public var title = ""
    public var content = ""
    public var category = "" 
    
    static let registerName = "articleContentModel"
    
    public init(title: String, content: String) {
        self.title	= title
        self.content	= content
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        title		= getJSONValue(named: "title", from: values, defaultValue: "")
        content		= getJSONValue(named: "content", from: values, defaultValue: "")
    }
    override public func getJSONValues() -> [String : Any] {
        return valuesToJSON()
    }
}

