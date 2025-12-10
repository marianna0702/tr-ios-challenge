//
//  Favorites.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/10/25.
//

import Foundation

@Observable
class Favorites: ObservableObject {
    static let shared = Favorites()
    var favorites = Set<Int>()
    
    init() {
       load()
    }
    
    func add(movieId: Int) {
        favorites.insert(movieId)
        save()
    }
    
    func remove(movieId: Int) {
        favorites.remove(movieId)
        save()
    }
    
    func find(movieId: Int) -> Bool {
        return favorites.contains(movieId)
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: "favorites"),
           let decodedIds = try? JSONDecoder().decode([Int].self, from: data) {
            favorites = Set(decodedIds)
        }
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(Array(favorites)) {
            UserDefaults.standard.set(encoded, forKey: "favorites")
        }
    }
}
