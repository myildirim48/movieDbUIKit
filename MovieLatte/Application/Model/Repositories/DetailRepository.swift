//
//  DetailRepository.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation
import Resolver

protocol DetailRepositoryProtocol {
    func loadDetailsOfSearchedItem(itemId: Int,itemType: String, appendToResponse: String,
                                    handler: @escaping (Result<DetailUIModel, Error>) -> Void)
}

final class DetailRepository: DetailRepositoryProtocol {
    
    @Injected private var serviceDetail: DetailRemoteServiceProtocol
    
    func loadDetailsOfSearchedItem(itemId: Int, itemType: String, appendToResponse: String, handler: @escaping (Result<DetailUIModel, Error>) -> Void) {
        
        serviceDetail.loadDetailsOfSearchedItem(itemId: itemId, itemType: itemType, appendToResponse: appendToResponse) { detailResult in
            switch detailResult {
            case .success(let response):
                let uiDetailData = DetailUIModel.converted(from: response)
                handler(.success(uiDetailData))
            case .failure(let err):
                handler(.failure(err))
            }
        }
    }
}
