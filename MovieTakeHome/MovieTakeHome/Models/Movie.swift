//
//  Movie.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

struct MovieList: Codable {
    let movies: [Movie]
}

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let thumbnail: String
    let year: Int
    
    var thumbnailURL: URL? {
        URL(string: thumbnail)
    }
}
