//
//  FavoritesMoviesListView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-21.
//

import SwiftUI

struct FavoritesMoviesListView: View {
    
    let movie: Movie
    
    var body: some View {
        NavigationLink(destination: MovieDetailsView(for: movie)) {
            HStack {
                if let imageURL = movie.posterPath {
                    TMDBImageView(url: "\(Constants.shared.imageURL+imageURL)")
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .cornerRadius(10)
                        .clipShape(Circle())
                    
                    Text(movie.title ?? "")
                        .fontWeight(.semibold)
                        .font(.system(size: 10))
                        .frame(width: 64, height: 30)
                        .foregroundStyle(Color(Constants.shared.color))
                        .truncationMode(.tail)
                        
                    Text(movie.overview ?? "")
                        .fontWeight(.semibold)
                        .font(.system(size: 10))
                        .foregroundStyle(Color(Constants.shared.color))
                        .truncationMode(.tail)
                    
                    Spacer()
                }
            }
            .padding(.vertical, 8)
        }
    }
}
