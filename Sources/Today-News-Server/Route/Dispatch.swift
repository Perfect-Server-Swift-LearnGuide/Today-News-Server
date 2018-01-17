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
    
    public static let requestFilters: [(HTTPRequestFilter,HTTPFilterPriority)] = [
        (RequestFilter(), HTTPFilterPriority.high)
    ]

}

extension SK_Dispatch {

    struct RequestFilter: HTTPRequestFilter {
         func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
            response.appendBody(string:
                """
                    {
                        "a" : "rrrr",
                        "bbb" : "r555"
                }
                """
            )
            print("method: \(request.method)")
            print("path: \(request.path)")
            print("queryParams: \(request.queryParams)")
            print("headers: \(request.headers)")
            print("postParams: \(request.postParams)")
            
            callback(.continue(request, response))
        }
    }

   
}
