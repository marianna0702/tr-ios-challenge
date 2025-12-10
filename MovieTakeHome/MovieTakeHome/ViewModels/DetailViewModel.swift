//
//  DetailViewModel.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var details: Details?
    @Published var recommendations: [Movie]?
    @Published var viewState: ViewState = .loading
    
    
    @MainActor
    func fetchMovieDetails(movieId: Int) async {
        do {
            viewState = .loading
            let movieDetails: Details = try await APIClient().requestData(for: .details(id: movieId))
            self.details = movieDetails
            viewState = .loaded
        } catch {
            viewState = .error
        }
    }
    
    @MainActor
    func fetchRecommendations(movieId: Int) async {
        do {
            let recommendations: MovieList = try await APIClient().requestData(for: .recommend(id: movieId))
            self.recommendations = recommendations.movies
        } catch {
            print("Error fetching recommendations")
        }
    }
    
    
}
