//
//  TNArticleCategoryListModel.swift
//  Today-News-Server
//
//  Created by sunquan on 2016/10/30.
//
//

import PerfectHTTP
import PerfectLib
import MongoDB
import PerfectHTTPServer

public class TNArticleCategoryListModel {
    public var categories = [TNArticleCategoryModel]()
    
    
    /// 加载首页分类数据
    public func loadCategories() -> String {
        
        var contents = loadFile(name: "category.json")

        /// 通过默认的端口连接MongoDB
        let client = try! MongoClient(uri: "mongodb://localhost")
        /// 获取数据库里的集合
        let db = client.getDatabase(name: "article")
        let collection = db.getCollection(name: "category")
        
        var start = contents.characters.startIndex
        var end = contents.characters.endIndex
        var tempStr = contents
        var numberID = 0
        
        /// 将JSON文件内容保存到数据库
        for index in 0...contents.characters.count {
            
            let char = contents.charAt(index: index)
            if char == "{" {
                start = tempStr.characters.index(of: char!)!
            }
            
            if char == "}" {
                end = tempStr.characters.index(of: char!)!
                var substring = String(tempStr.characters[start ... end])
                tempStr = contents[contents.index(contents.startIndex, offsetBy: index + 1) ..< contents.characters.endIndex]
                // substring.replaceSubrange(substring.startIndex...substring.index(substring.startIndex, offsetBy: 1), with: "[")
                // substring.replaceSubrange(substring.index(substring.endIndex, offsetBy: -1)..<substring.endIndex, with: "]")
                /// 生成_id
                numberID = numberID + 1
                
                let doc = try! BSON(json: substring)
                doc.append(key: "_id", int: numberID)
                // 将信息存放到集合中
                let result = collection?.save(document: doc)
            }
        }
        
        /// 获取该集合下所有的信息
        let cursor = collection?.find(query: BSON())
        while let c = cursor?.next() {
             let dict = dictWithJSON(bson: c)
            categories.append(TNArticleCategoryModel.modelWithDict(dict: dict as! [String : AnyObject]))
        }
        
        /// 关闭连接
        defer {
            collection?.close()
            client.close()
            db.close()
        }
        return list()
    }
    
    // MARK: - 添加方法
    /// 添加一个HTTPRequest对象
    public func add(_ request: HTTPRequest) -> String {
        let new = TNArticleCategoryModel(
            category : request.param(name: "category")!,
            web_url : request.param(name: "web_url")!,
            flags : Int(request.param(name: "flags")!)!,
            name : request.param(name: "name")!,
            tip_new : Int(request.param(name: "tip_new")!)!,
            default_add : Int(request.param(name: "default_add")!)!,
            concern_id : request.param(name: "concern_id")!,
            type : Int(request.param(name: "type")!)!,
            icon_url : request.param(name: "icon_url")!
        )
        categories.append(new)
        return toString()
    }
    
    /// 添加一个json字符串
    public func add(_ json: String) -> String {
        do {
            let incoming = try json.jsonDecode() as! [String: String]
            let new = TNArticleCategoryModel(
                category : incoming[ "category"]!,
                web_url : incoming[ "web_url"]!,
                flags : Int(incoming[ "flags"]!)!,
                name : incoming[ "name"]!,
                tip_new : Int(incoming[ "tip_new"]!)!,
                default_add : Int(incoming[ "default_add"]!)!,
                concern_id : incoming[ "concern_id"]!,
                type : Int(incoming[ "type"]!)!,
                icon_url : incoming[ "icon_url"]!
            )
            categories.append(new)
        } catch {
            return "ERROR"
        }
        return toString()
    }
    
    // MARK: - 辅助方法
    public func list() -> String {
        return toString()
    }
    
    /// 获取文件内容
    func loadFile(name: String) -> String {
        /// 创建文件
        let thisFile = File(name)
        try! thisFile.open(.readWrite)
        defer {
            thisFile.close()
        }
        /// 读取文件内容
        let contents = try! thisFile.readString()
        return contents
    }
    
    /// 模型数组转JSON
    private func toString() -> String {
        var out = [String]()
        for m in self.categories {
            do {
                out.append(try m.jsonEncodedString())
            } catch {
                print(error)
            }
        }
        return "[\(out.joined(separator: ","))]"
    }
    
    /// 将BSON对象转换为字典
    func dictWithJSON(bson: BSON) -> JSONConvertible {
        let json = bson.asString
        let jsonDict = try! json.jsonDecode()
        return jsonDict
    }
}
