//
//  TNArticleContentHandler.swift
//  Today-News-Server
//
//  Created by 百城 on 16/10/29.
//
//

import PerfectHTTP

/// 获取对应分类文章
public func articleContentHandler() -> RequestHandler {
    
    return { request, response in
        setupResponseHeader(response: response)
        let params = request.params()
        var datas = [[String : AnyObject]]()
        for param in params {
            datas.append([ param.0 : param.1 as AnyObject])
        }
        print(datas)
        var json = ""
        do {
            json = try datas.jsonEncodedString()
        } catch  {
            json = "ERROR"
        }
        
        response.appendBody(string: json)
        
        response.completed()
    }

}

/// 设置响应头
private func setupResponseHeader(response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
}
