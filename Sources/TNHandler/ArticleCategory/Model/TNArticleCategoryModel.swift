//
//  TNArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

class TNArticleCategoryModel {

    var categories = [String: Any]()
    
    init(){
        categories = [
            "code" : 200,
            "datas" : [
                "推荐",
                "热点",
                "北京",
                "视频",
                "订阅",
                "数码",
                "社会",
                "娱乐",
                "科技",
                "汽车",
                "体育",
                "财经",
                "军事",
                "国际",
                "段子",
                "趣图",
                "美女",
                "健康",
                "正能量"
            ]
        ]
    }
    
    public func list() -> String {
        return toJsonString()
    }
    
    private func toJsonString() -> String {
        var encoded = ""
        do {
            encoded = try categories.jsonEncodedString()
        } catch {
            encoded = "ERROR"
        }
        return encoded
    }
}
