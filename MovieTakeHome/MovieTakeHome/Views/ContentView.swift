//
//  ContentView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieListViewModel()
    private var favorites = Favorites.shared
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                switch viewModel.searchState {
                    case .loading:
                        ProgressView()
                    case .loaded:
                        ScrollView {
                            ForEach(viewModel.movies) { movie in
                                NavigationLink(value: movie) {
                                    MovieResultView(movie: movie)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.horizontal)
                        }
                    case .error:
                        Text("Something went wrong")
                            .font(.headline)
                        Button("Retry") {
                            Task {
                                await viewModel.getMovieList()
                            }
                        }
                    case .empty:
                        Text("No movies found")
                }
          
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Movie.self) { movie in
                DetailView(movieID: movie.id)
            }
        }
        .task() {
            Task {
                await viewModel.getMovieList()
            }
        }
    }
}

#Preview {
    ContentView()
}
