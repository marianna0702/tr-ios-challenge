//
//  MovieListViewModel.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchState: SearchState = .loading
    
    enum SearchState {
        case loading
        case loaded
        case error
        case empty
    }
    
    init(movies: [Movie] = [], searchState: SearchState = .loading) {
        self.movies = movies
        self.searchState = searchState
    }
    
    @MainActor
    func getMovieList() async {
        do {
            searchState = .loading
            let list: MovieList = try await APIClient().requestData(for: .list)
            movies = list.movies
            
            if movies.isEmpty {
                searchState = .empty
            } else {
                searchState = .loaded
            }
        } catch {
            searchState = .error
        }
    }
}
