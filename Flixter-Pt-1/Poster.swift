//
//  Poster.swift
//  Flixter-Pt-1
//
//  Created by Kennedy Parks on 3/13/23.
//

import Foundation

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: URL
    let backdrop_path: URL
}

 
extension Poster {

    
}
