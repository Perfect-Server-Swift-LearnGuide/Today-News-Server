//
//  TNArticleCategoryModel.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

public class TNArticleCategoryModel {

    public var categories = [String]()
    
    init(){
        categories = [
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
    }
    
    public func list() -> String {
        return toJsonString()
    }
    
    private func toJsonString() -> String {
        let categoriesTemp: [String: Any] = [
            "code" : 200,
            "datas" : categories
        ]

        var encoded = ""
        do {
            encoded = try categoriesTemp.jsonEncodedString()
        } catch {
            encoded = "ERROR"
        }
        return encoded
    }
}
