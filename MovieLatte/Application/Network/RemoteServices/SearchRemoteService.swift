//
//  SearchRemoteService.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
protocol SearchServiceProtocol {
    func getSearchedItems(queryText:String,
                          page: Int,
                          handler: @escaping (Result<MultiSearchResponse, Error>) -> Void)
}

final class SearchRemoteService : SearchServiceProtocol, Requestable {
    
    typealias TargetEndPoint = Endpoints
    
    func getSearchedItems(queryText: String, page: Int, handler: @escaping (Result<MultiSearchResponse, Error>) -> Void) {
        var requestObject = TargetEndPoint.multiSearch.commonRequestObject
        requestObject.parameters["query"] = queryText
        requestObject.parameters["page"] = String(page)
        request(with: requestObject, completionHandler: handler)
    }
}
