//
//  SearchRepository.swift
//  MovieLatte
//
//  Created by YILDIRIM on 4.01.2023.
//

import Resolver
import Foundation

protocol SearchRepositoryProtocol {
    
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MultiSearchUIModel],Error>) -> Void)
}

final class SearchRepository: SearchRepositoryProtocol {
    
    @Injected private var service: SearchServiceProtocol
    
    func getSearched(queryText:String,
                     page:Int,
                     handler: @escaping (Result<[MultiSearchUIModel], Error>) -> Void) {
        
        service.getSearchedItems(queryText: queryText, page: page) { result in
            switch result{
            case .success(let response):
                let uiMovieSearchModel = MultiSearchUIModel.convert(from: response)
                handler(.success(uiMovieSearchModel))
            case .failure(let error):
                handler(.failure(error))
            }
        }
        
    }
}
