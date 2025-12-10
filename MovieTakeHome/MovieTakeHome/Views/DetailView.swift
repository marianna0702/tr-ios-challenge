//
//  DetailView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var movieID: Int
    @StateObject private var viewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
                case .loading:
                    ProgressView()
                case .loaded:
                    if let details = viewModel.details {
                        ScrollView {
                            KFImage(details.pictureURL)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                            Text(details.name)
                                .font(.title)
                            HStack {
                                Text(details.releaseDate.fullDateString)
                                FavoritesView(movieId: movieID)
                            }
                            Divider()
                            Text("Description")
                                .font(.headline)
                            Text(details.description)
                                .font(.caption)
                            Divider()
                            Text("Notes")
                                .font(.headline)
                            Text(details.notes)
                                .font(.caption)
                            Divider()
                            if let recommendations = viewModel.recommendations,
                               recommendations.count > 0 {
                                Text("Recommended")
                                    .font(.headline)
                                RecommendedView(movies: recommendations)
                            }
                        }
                    }
                case .error, .empty:
                    Text("Something went wrong")
                        .font(.headline)
                    Button("Retry") {
                        Task {
                            await viewModel.fetchMovieDetails(movieId: movieID)
                        }
                    }
            }
        }
        .padding()
        .task {
            await viewModel.fetchMovieDetails(movieId: movieID)
            await viewModel.fetchRecommendations(movieId: movieID)
        }
    }
}

#Preview {
    DetailView(movieID: 1)
}
