//
//  MovieListViewModel.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchState: ViewState = .loading
    
    init(movies: [Movie] = [], searchState: ViewState = .loading) {
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
