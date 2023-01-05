//
//  DetailRemoteService.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation
protocol DetailRemoteServiceProtocol {
    func loadDetailsOfSearchedItem(itemId: Int,itemType: String, appendToResponse: String,
                                    handler: @escaping (Result<DetailResponse, Error>) -> Void)
}

final class DetailRemoteService : DetailRemoteServiceProtocol, Requestable {    

    typealias TargetEndPoint = Endpoints

    //I added functionality to this func (itemType) "videos,credits"
    // I will take this data from searched one
    
    func loadDetailsOfSearchedItem(itemId: Int,itemType: String, appendToResponse: String,
                                    handler: @escaping (Result<DetailResponse, Error>) -> Void) {
        var requestObject = TargetEndPoint.detail(type: itemType, id: itemId).commonRequestObject
        requestObject.parameters["append_to_response"] = appendToResponse
        request(with: requestObject, completionHandler: handler)
    }
}
