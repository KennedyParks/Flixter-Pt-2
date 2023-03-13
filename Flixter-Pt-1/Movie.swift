//
//  Movie.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/3/23.
//

import Foundation

struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: URL
    // details
    let backdrop_path: URL
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}

struct MoviesResponse: Decodable {
    let results: [Movie]
}
 
extension Movie {

    
}
