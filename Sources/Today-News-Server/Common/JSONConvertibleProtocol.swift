//
//  JSONProtocol.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/31.
//
//

import PerfectLib

/// 模型属性转JSON
public protocol JSONConvertibleProtocol {
    
    /// 模型属性转JSON
    func valuesToJSON() -> [String : Any]
    
//    func JSONToValues(_ values: [String:Any])
}

public extension JSONConvertibleProtocol {
    func valuesToJSON() -> [String : Any] {
        let mirror = Mirror(reflecting: self)
        var dict = [String: AnyObject]()
        for child in mirror.children {
            let value = child.value
            if let key = child.label {
                dict.updateValue(value as! AnyObject, forKey: key)
            }
        }
        return dict
    }
    
}
