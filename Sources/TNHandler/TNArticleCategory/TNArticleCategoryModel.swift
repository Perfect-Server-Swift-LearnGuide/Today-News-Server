//
//  TNArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectLib
import TNCommon

public class TNArticleCategoryModel: JSONConvertibleObject, TNJSONConvertibleProtocol {
    
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
    
    public override init() {
        
    }
    
    public static func modelWithDict(dict: [String : AnyObject]) -> TNArticleCategoryModel {

//        let model = TNArticleCategoryModel(
//            category: dict[ "category"] as? String,
//            web_url: dict[ "web_url"] as? String,
//            flags: dict[ "flags"] as! Int,
//            name: dict[ "name"] as! String,
//            tip_new: dict[ "tip_new"] as! Int,
//            default_add: dict[ "default_add"]as! Int,
//            concern_id: dict[ "concern_id"] as! String,
//            type: dict[ "type"] as! Int,
//            icon_url: dict[ "icon_url"] as! String
//        )
//
        let model = TNArticleCategoryModel()
//        print(dict)
        model.setJSONValues(dict)
//        let model = TNArticleCategoryModel(category: "", web_url: "", flags: 0, name: "", tip_new: 0, default_add: 0, concern_id: "", type: 0, icon_url: "")
        return model
    }
    
    override public func setJSONValues(_ values: [String : Any]) {
        category		= getJSONValue(named: "category", from: values, defaultValue: "")
        web_url		= getJSONValue(named: "web_url", from: values, defaultValue: "")
        flags		= getJSONValue(named: "flags", from: values, defaultValue: 0)
        name		= getJSONValue(named: "name", from: values, defaultValue: "")
        tip_new		= getJSONValue(named: "tip_new", from: values, defaultValue: 0)
        default_add		= getJSONValue(named: "default_add", from: values, defaultValue: 0)
        concern_id		= getJSONValue(named: "concern_id", from: values, defaultValue: "")
        type		= getJSONValue(named: "type", from: values, defaultValue: 0)
        icon_url		= getJSONValue(named: "icon_url", from: values, defaultValue: "")
    }
    override public func getJSONValues() -> [String : Any] {
        return valuesToJSON()
    }
}

