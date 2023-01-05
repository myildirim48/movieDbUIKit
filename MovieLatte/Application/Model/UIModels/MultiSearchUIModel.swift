//
//  MultiSearchUIModel.swift
//  MovieLatte
//
//  Created by YILDIRIM on 4.01.2023.
//

import Foundation

struct MultiSearchUIModel:Identifiable,Equatable{
    
    let id : Int
    let mediaType: MediaType?
    let profilePath :String?
    let name : String?
    let originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    
    static func == (lhs:MultiSearchUIModel, rhs: MultiSearchUIModel)-> Bool {
        return lhs.id == rhs.id
    }
    
    var searchedObjectTitle: String {
        if title != nil {
            return title ?? "titleError"
        }else if name != nil {
            return name ?? "nameError"
        }else { return "ErrorObjectTitle"}
    }
    
    var searchedObjectPhotoUI: String{
        if posterPath != nil{
            return "\(AppConfig.imageUrl)\(posterPath ?? "")"
        }else if profilePath != nil{
            return "\(AppConfig.imageUrl)\(profilePath ?? "")"
        }
        else { return "" } //https://image.tmdb.org/t/p/w500/dJZdaQXZ0qSeT4BrTibVIyl2JcZ.jpg Atam
    }
    
    
    var searchedObjectTypeUI: String {
        switch mediaType{
        case .person : return "Person"
        case .tv : return "Tv"
        case .movie : return "Movie"
        case .none: return "No Type" //Update
        }
    }
    
    
    
    var ratingTextUi: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    var yearTextUi : String {
        guard let releaseDate = self.releaseDate, let date = DateFormatterStruct.dateFormatter.date(from: releaseDate) else {
            return "n / a"
        }
        return MultiSearchUIModel.yearFormatter.string(from: date)
    }
    
    var scoreTextUi: String {
        guard ratingTextUi.count > 0 else {
            return "n / a"
        }
        return "\(ratingTextUi.count)/10"
    }
}

extension MultiSearchUIModel {
    
    static func convert(from response: MultiSearchResponse ) -> [MultiSearchUIModel] {
        return response.results.map { response in
            
            return MultiSearchUIModel(
                id: response.id, mediaType: response.mediaType, profilePath: response.profilePath, name: response.name,
                                            originalTitle: response.originalTitle, overview: response.overview, posterPath: response.posterPath, releaseDate: response.releaseDate, title: response.title, voteAverage: response.voteAverage, voteCount: response.voteCount)
            
        }
    }
    
}
