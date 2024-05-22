//
//  MovieDetailsHeaderView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-22.
//

import Foundation
import SwiftUI

struct MovieDetailsHeaderView: View {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        Text(movie.title ?? "")
            .fontWeight(.semibold)
            .font(.subheadline)
        
        Button(action: {
            movie.isFavourite = !movie.isFavourite
        }, label: {
            Image(systemName: movie.isFavourite ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(movie.isFavourite ? .red : Color(Constants.shared.color))
        })
    }
}

#Preview {
    MovieDetailsHeaderView(movie: Movie(id: 1, overview: "Overview", title: "Title", posterPath: "PosterPath", releaseDate: "21 - 01 - 2021", isFavourite: true))
}
