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
    
    public static let responseFilters: [(HTTPResponseFilter, HTTPFilterPriority)] = [
        (ResponseFilter(), HTTPFilterPriority.high)
    ]

}

extension SK_Dispatch {

    struct RequestFilter: HTTPRequestFilter {
         func filter(request: HTTPRequest, response: HTTPResponse, callback: (HTTPRequestFilterResult) -> ()) {
//            print("method: \(request.method)")
//            print("path: \(request.path)")
//            print("queryParams: \(request.queryParams)")
//            print("headers: \(request.headers)")
//            print("postParams: \(request.postParams)")
            callback(.continue(request, response))
        }
    }

}

extension SK_Dispatch {
    
    struct ResponseFilter: HTTPResponseFilter {
        func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
            response.setHeader(.contentType, value: "application/json")
            callback(.done)
        }
        func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
            callback(.done)
        }
    }
}
