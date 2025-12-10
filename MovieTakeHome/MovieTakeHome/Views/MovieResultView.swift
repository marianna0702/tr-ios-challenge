//
//  MovieResultView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/9/25.
//

import SwiftUI
import Kingfisher

struct MovieResultView: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .clipShape(Rectangle())
                
            VStack(alignment: .leading) {
                Text(movie.name)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                Text(movie.year.yearString)
                    .font(.callout)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            FavoritesView(movieId: movie.id)
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
