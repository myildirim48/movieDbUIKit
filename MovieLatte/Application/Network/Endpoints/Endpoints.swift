//
//  Endpoints.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
enum Endpoints : TargetEndpointProtocol {
    var base: String {
        AppConfig.baseUrl
    }
    
    case detail(type:String,id:Int)
    case multiSearch
    
    var path: String {
        
        switch self {
        case .multiSearch:
            return "/3/search/multi"
        case .detail(type: let type, id: let id):
            return "/3/\(type)/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod{
        return .get
    }
    
    var commonRequestObject: RequestObject{
        var requestObject = RequestObject(host: base, path: path,httpMethpd: httpMethod)
        requestObject.parameters["api_key"] = AppConfig.apikey
        return requestObject
    }
    
}
