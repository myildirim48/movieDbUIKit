//
//  Requestable.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
import Resolver

protocol Requestable {
    associatedtype TargetEndPoint: TargetEndpointProtocol
 
    func request<T: Decodable>(baseService: BaseServiceProtocol,
                              with object: RequestObject,
                              completionHandler: @escaping (Result<T, Error>) -> Void )
}

extension Requestable {
    
    func request<T: Decodable> (baseService: BaseServiceProtocol = Resolver.resolve(),
                                with object: RequestObject,
                                completionHandler: @escaping (Result<T, Error>) -> Void ) {
        baseService.request(with: object, handler: completionHandler)
    }
}
