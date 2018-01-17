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
    var request: HTTPRequest?
    
    lazy  var requestFilters: [(HTTPRequestFilter,HTTPFilterPriority)] = [
        (self, HTTPFilterPriority.high)
    ]
    
    
    
     lazy var routes: Routes = {
            var routes = Routes()
            /// 设置主路由
            var baseRoutes = Routes(baseUri: Server.Route.baseUrl.rawValue)
        
//        print("================   \(self.request!.method)")
//            /// 文章
//            let article = ArticleController.article()
//            
//            /// 用户
//            let user = User.user()
            //        baseRoutes.add(method: )
            
            //        /// 文章
//        print(HTTPMethod.from(string: request.method))
        baseRoutes.add(method: .get, uri: "*", handler: {
                req, res in
                print("route")
            })
            //
            //        /// 用户
            //        baseRoutes.add(method: .get, uri: "user/{action}", handler: user)
            
            /// 注册到服务器主路由表上
            routes.add(baseRoutes)
            
        return routes
    }()
  

}

extension SK_Dispatch: HTTPRequestFilter {

         public func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
            self.request = request
            print("method: \(self.request?.method)")
            print("path: \(self.request?.path)")
            print("queryParams: \(self.request?.queryParams)")
            print("headers: \(self.request?.headers)")
            print("postParams: \(request.postParams)")
          
            callback(.continue(request, response))
        }
   
}
