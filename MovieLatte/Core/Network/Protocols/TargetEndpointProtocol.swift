//
//  TargetEndpointProtocol.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
protocol TargetEndpointProtocol {
    var base : String { get }
    var path : String { get }
    var httpMethod : HTTPMethod { get }
    var commonRequestObject : RequestObject { get }
}
