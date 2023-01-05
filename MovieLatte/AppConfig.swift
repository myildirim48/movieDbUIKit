//
//  AppConfig.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation
enum AppEnvironment {
    case development
    case staging
    case production
}

final class AppConfig{
    static var apikey = "249671eff0295b9410c95cbf7aabbef4"
    
    
    static var configuration: AppEnvironment {
        #if DEVELOPMENT
        return .development
        #elseif PRODUCTION
        return .production
        #else
        return .staging
        #endif
    }
    
    static var baseUrl : String {
        switch configuration {
        case .development:
            return "api.themoviedb.org"
        case .staging:
            return "api.themoviedb.org"
        case .production:
            return "api.themoviedb.org"
        }
    }
    
    static var imageUrl : String {
        switch configuration {
        case .development:
            return "https://image.tmdb.org/t/p/w500"
        case .staging:
            return "https://image.tmdb.org/t/p/w500"
        case .production:
            return "https://image.tmdb.org/t/p/w500"
        }
    }
    
    static func getPosterURL(query: String) -> String{
        return imageUrl+query
    }
}
