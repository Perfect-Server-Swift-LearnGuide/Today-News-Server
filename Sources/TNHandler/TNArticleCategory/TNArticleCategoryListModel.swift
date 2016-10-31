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
    
    public func list() -> String {
        return toString()
    }
    
    public func loadCategories() -> String {
        /// 创建文件
        let thisFile = File("category.json")
        try! thisFile.open(.readWrite)
        defer {
            thisFile.close()
        }
        
        var contents = try! thisFile.readString()

        /// 通过默认的端口连接MongoDB
        let client = try! MongoClient(uri: "mongodb://localhost:27017")
        /// 获取数据库里的集合
        let collection = client.getCollection(databaseName: "article", collectionName: "category")

        // 初始化一个空数组用于接收格式化结果
        var arr = ""
        
        for char in contents.characters {

            var start = contents.startIndex
            var end = contents.endIndex
            if char == "{" {
                start = contents.index(before: char)
            }
            
            if char == "}" {
                end = contents.characters.index(of: char)!
//                var range = Range<String.CharacterView.Index>(start: start, end: end)
                let str = contents.substring(with: Range<String.Index>)
                print("\(str)\n")
                continue
            }
            
            
//            arr.append(char)
//            if char == "}" {
//                /// 用JSON字符串生成MongoDB所支持的BSON格式
//                let doc = try! BSON(json: arr)
//                /// 将信息存放到集合中
//                let res = collection.remove(selector: doc)
//                let result = collection.save(document: doc)
//                arr = ""
//            }
        }
//        print(contents)


        /// 获取该集合下所有的信息
        let cursor = collection.find(query: BSON())
        /// 获取信息”
        var index = 0
        
        while let c = cursor?.next() {
            index = index + 1
            print(index)
             let dict = modelJSON(bson: c)
            categories.append(TNArticleCategoryModel.modelWithDict(dict: dict as! [String : AnyObject]))
        }
        defer {
            /// 关闭连接
            collection.close()
            client.close()
        }
        return list()
    }
    
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
    
    /// 将一个包含ObjectId的BSON对象转换为包含id的字典
    func modelJSON(bson: BSON) -> JSONConvertible {
        let json = bson.asString

        let jsonDict = try! json.jsonDecode()
        print( Mirror(reflecting: jsonDict) )
//        print(jsonDict)
//        print("\n\n")
        return jsonDict
    }
}
