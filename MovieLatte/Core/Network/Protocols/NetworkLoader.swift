//
//  NetworkLoader.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
protocol NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping(Data?,URLResponse?,Error?) -> Void)
}
