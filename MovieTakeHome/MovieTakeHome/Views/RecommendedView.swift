//
//  RecommendedView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/10/25.
//

import SwiftUI
import Kingfisher

struct RecommendedView: View {
    var movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(movies) { movie in
                    NavigationLink(value: movie) {
                        KFImage(movie.thumbnailURL)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .clipShape(Rectangle())
                    }
                }
            }
        }
    }
}

#Preview {
    RecommendedView(movies: [])
}
