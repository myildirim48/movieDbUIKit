//
//  DetailUIModel.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation

struct DetailUIModel: Identifiable, Equatable {
    
    let id: Int
    let title: String?
    let name: String?
    
    let backdropPath: String?
    let posterPath: String?
    let overview: String?
    let voteAverage: Double?
    let voteCount: Int?
    let runtime: Int?
    let releaseDate: String?
    let profilePath: String?
    let tagline: String?
    
    //Person
    let biography: String?
    let placeOfBirth: String?
    let birthDay: String?
    let deathDay: String?
    
    //All
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    
    static func == (lhs:DetailUIModel, rhs:DetailUIModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    //MARK: - Credits,Videos
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    var crew: [MovieCrew]? {
        credits?.crew
    }
    
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
    
    //Title,Photo
    var detailedObjectTitle: String {
        if title != nil {
            return title ?? "titleError"
        }else if name != nil {
            return name ?? "nameError"
        }else { return "ErrorObjectTitle"}
    }
    
    //OverView Bio
    var detailOverBio: String{
        if overview != nil {
            return overview ?? "overViewError"
        }else if biography != nil {
            return biography ?? "bioError"
        }else { return "ErrorDetailOVerBio"}
    }
    
    var detailPhotoUI: String{
        if backdropPath != nil{
            return "https://image.tmdb.org/t/p/w500\(backdropPath ?? "back")"
        }else if profilePath != nil{
            return "https://image.tmdb.org/t/p/w500\(profilePath ?? "profi")"
        }else if posterPath != nil {
            return "https://image.tmdb.org/t/p/w500\(posterPath ?? "poster")"
        }
        else { return "https://image.tmdb.org/t/p/w500/dJZdaQXZ0qSeT4BrTibVIyl2JcZ.jpg" } // Atam
    }
    
    //Rating,Score
    var ratingTextUi: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreTextUi: String {
        guard ratingTextUi.count > 0 else {
            return "n / a"
        }
        return "\(ratingTextUi.count)/10"
    }
    

  
}

//MARK: - Extensions
extension DetailUIModel {
   
    //Enlighten me master about here
    
    static func converted(from response: DetailResponse) -> DetailUIModel {
            
            return DetailUIModel(id: response.id, title: response.title, name: response.name, backdropPath: response.backdropPath, posterPath: response.posterPath, overview: response.overview, voteAverage: response.voteAverage, voteCount: response.voteCount, runtime: response.runtime, releaseDate: response.releaseDate, profilePath: response.profilePath, tagline: response.tagline, biography: response.biography, placeOfBirth: response.placeOfBirth, birthDay: response.birthDay, deathDay: response.deathDay, credits: response.credits, videos: response.videos)
        
    }
}
