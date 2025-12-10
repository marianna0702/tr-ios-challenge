//
//  MovieResultView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import SwiftUI

struct MovieResultView: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // TODO: try cache library
            AsyncImage(url: movie.thumbnailURL) { result in
                switch result {
                    case .empty:
                        ProgressView()
                            .frame(width: 85, height: 125)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Rectangle())
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 85, height: 125)
                    @unknown default:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .frame(width: 85, height: 125)
                }
            }
            VStack(alignment: .leading) {
                Text(movie.name)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Text(movie.year.yearString)
                    .font(.callout)
                    .foregroundStyle(Color.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    MovieResultView(movie: .init(
        id: 1,
        name: "Test Movie",
        thumbnail: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/1.jpg",
        year: 2025))
}
