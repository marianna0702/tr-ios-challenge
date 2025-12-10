//
//  FavoritesView.swift
//  MovieTakeHome
//
//  Created by Marianna on 12/10/25.
//

import SwiftUI

struct FavoritesView: View {
    var movieId: Int
    
    var body: some View {
        Button {
            if Favorites.shared.find(movieId: movieId) {
                Favorites.shared.remove(movieId: movieId)
            } else {
                Favorites.shared.add(movieId: movieId)
            }
        } label: {
            Image(systemName: Favorites.shared.find(movieId: movieId) ? "heart.fill" : "heart")
                .foregroundStyle(Color.red)
        }
    }
}

#Preview {
    FavoritesView(movieId: 1)
}
