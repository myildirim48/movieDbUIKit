//
//  BaseServiceProtocol.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
import Resolver

protocol BaseServiceProtocol {
    func request<T:Decodable>(with: RequestObject,
                              decoder: JSONDecoder,
                              handler: @escaping(Result<T,Error>)->Void)
}
extension BaseServiceProtocol {
    func request<T: Decodable> (with requestObject: RequestObject,
                                decoder: JSONDecoder = Resolver.resolve(),
                              handler: @escaping (Result<T, Error>) -> Void) {
        request(with: requestObject, decoder: decoder, handler: handler)
    }
}
