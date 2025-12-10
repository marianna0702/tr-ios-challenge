//
//  ContentView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                switch viewModel.searchState {
                    case .loading:
                        ProgressView()
                    case .loaded:
                        ScrollView {
                            ForEach(viewModel.movies) { movie in
                                MovieResultView(movie: movie)
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
