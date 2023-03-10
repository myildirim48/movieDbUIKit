//
//  URLSessionExtension.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation

extension URLSession: NetworkLoader {
    func load(using request: URLRequest, with completion: @escaping(Data?,URLResponse?,Error?) -> Void){
        self.dataTask(with: request, completionHandler: completion).resume()
    }
}
