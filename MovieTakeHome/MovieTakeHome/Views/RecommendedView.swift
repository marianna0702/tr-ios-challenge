//
//  RecommendedView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/10/25.
//

import SwiftUI

struct RecommendedView: View {
    var movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(movies) { movie in
                    AsyncImage(url: movie.thumbnailURL) { result in
                        switch result {
                            case .empty:
                                ProgressView()
                                    .frame(width: 85, height: 125)
                            case .success(let image):
                                NavigationLink(value: movie) {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 125, height: 125)
                                        .clipShape(Rectangle())
                                }
                            case .failure:
                                EmptyView()
                            @unknown default:
                                EmptyView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecommendedView(movies: [])
}
