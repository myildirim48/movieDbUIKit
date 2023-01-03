//
//  MultiSearchResponse.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Foundation

struct MultiSearchResponse: Codable{
    let page: Int?
    let results: [MultiSearchResult]
    let totalPages : Int?
    let totalResults: Int?
}

struct MultiSearchResult: Codable {
    let id: Int
    let knownForDepartment: String?
    let mediaType: MediaType?
    let name: String?
    let profilePath :String?
    let originalTitle, overview: String?
    let posterPath: String?
    let releaseDate, title: String?
    let voteAverage: Double?
    let voteCount: Int?
    let firstAirDate: String?
}
//MARK: - Mediatype
enum MediaType: String, Codable {
    case movie = "movie"
    case person = "person"
    case tv = "tv"
}
