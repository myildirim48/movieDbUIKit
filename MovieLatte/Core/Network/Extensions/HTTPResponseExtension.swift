//
//  HTTPResponseExtension.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation

extension HTTPURLResponse {
    var httpStatus: HTTPStatus? {
        HTTPStatus(rawValue: statusCode)
    }
}
