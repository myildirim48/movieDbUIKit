//
//  DetailResponse.swift
//  MovieLatte
//
//  Created by YILDIRIM on 5.01.2023.
//

import Foundation

struct DetailResponse: Codable,Equatable {
    
    static func == (lhs: DetailResponse, rhs: DetailResponse) -> Bool {
        lhs.id == rhs.id
    }

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
}

//MARK: - SpecialDataTypes
struct MovieGenre: Codable {
    
    let name: String
}

struct MovieCredit: Codable {
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Codable, Identifiable {
    let id: Int
    let character: String
    let name: String
}

struct MovieCrew: Codable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct MovieVideoResponse: Codable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Codable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
