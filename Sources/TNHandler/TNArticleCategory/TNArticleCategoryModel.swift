//
//  TNArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib

public class TNArticleCategoryModel: JSONConvertibleObject {
    
    public var category = ""
    public var web_url = ""
    public var flags = 0
    public var name = ""
    public var tip_new = 0
    public var default_add = 0
    public var concern_id = ""
    public var type = 0
    public var icon_url = ""
    
    static let registerName = "articleCategoryModel"
    
    public init(category: String,
                        web_url: String,
                        flags: Int,
                        name: String,
                        tip_new: Int,
                        default_add: Int,
                        concern_id: String,
                        type: Int,
                        icon_url: String
                        ) {
        self.category = category
        self.web_url = web_url
        self.flags = flags
        self.name = name
        self.tip_new = tip_new
        self.default_add = default_add
        self.concern_id = concern_id
        self.type = type
        self.icon_url = icon_url
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        self.category		= getJSONValue(named: "category", from: values, defaultValue: "")
        self.web_url		= getJSONValue(named: "web_url", from: values, defaultValue: "")
        self.flags		= getJSONValue(named: "flags", from: values, defaultValue: 0)
        self.name		= getJSONValue(named: "name", from: values, defaultValue: "")
        self.tip_new		= getJSONValue(named: "tip_new", from: values, defaultValue: 0)
        self.default_add		= getJSONValue(named: "default_add", from: values, defaultValue: 0)
        self.concern_id		= getJSONValue(named: "concern_id", from: values, defaultValue: "")
        self.type		= getJSONValue(named: "type", from: values, defaultValue: 0)
        self.icon_url		= getJSONValue(named: "icon_url", from: values, defaultValue: "")
    }
    override public func getJSONValues() -> [String : Any] {
        return [
            "category" : category,
            "web_url" : web_url,
            "flags" : flags,
            "name" : name,
            "tip_new" : tip_new,
            "default_add" : default_add,
            "concern_id" : concern_id,
            "type" : type,
            "icon_url" : icon_url,
        ]
    }
}

