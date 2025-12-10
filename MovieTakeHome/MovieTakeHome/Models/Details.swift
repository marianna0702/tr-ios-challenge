//
//  Details.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

struct Details: Codable {
    let id: Int
    let name: String
    let description: String
    let notes: String
    let rating: Double
    let picture: String
    let releaseDate: Int
    
    var pictureURL: URL? {
        URL(string: picture)
    }
    
    var ratingString: String {
        let string = String(format: "%.1f", rating)
        return string + "/10"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description = "Description"
        case notes = "Notes"
        case rating = "Rating"
        case picture
        case releaseDate
    }
}
