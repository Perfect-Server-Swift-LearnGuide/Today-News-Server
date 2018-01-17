//
//  Dispatch.swift
//  Today-News-Server
//
//  Created by Mac on 18/1/17.
//
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

open class SK_Dispatch {
    
//    var requestFilter = RequestFilter()
    
    
    static var requestFilters: [(HTTPRequestFilter,HTTPFilterPriority)] = [
        (RequestFilter(), HTTPFilterPriority.high)
    ]
    
    static var routes: Routes = {
            var routes = Routes()
            /// 设置主路由
            var baseRoutes = Routes(baseUri: Server.Route.baseUrl.rawValue)
            
//            /// 文章
//            let article = ArticleController.article()
//            
//            /// 用户
//            let user = User.user()
            //        baseRoutes.add(method: )
            
            //        /// 文章
//        print(HTTPMethod.from(string: request.method))
//        baseRoutes.add(method: HTTPMethod.from(string: requestFilter.request.method), uri: "*", handler: {
//                req, res in
//                print("route")
//            })
            //
            //        /// 用户
            //        baseRoutes.add(method: .get, uri: "user/{action}", handler: user)
            
            /// 注册到服务器主路由表上
            routes.add(baseRoutes)
            
        return routes
    }()
  

}

extension SK_Dispatch {
    struct RequestFilter: HTTPRequestFilter {
        
        var request: HTTPRequest
        
        
         func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
            print("method: \(request.method)")
            print("path: \(request.path)")
            print("queryParams: \(request.queryParams)")
            print("headers: \(request.headers)")
            print("postParams: \(request.postParams)")
       //     self.request = request
            callback(.continue(request, response))
        }
    }
}
