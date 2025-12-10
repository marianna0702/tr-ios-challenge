//
//  Int+DateFormatter.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

extension Int {
    var yearString: String {
        return String(self)
    }
    
    var fullDateString: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
