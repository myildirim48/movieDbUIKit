//
//  HTTPMethod.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible{
    case get
    case post
    case put
    case delete
    
    var description: String{
        rawValue.uppercased()
    }
}
