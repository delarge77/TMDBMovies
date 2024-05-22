//
//  TopRatedMoviesView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import SwiftUI

struct TopRatedMoviesView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {

            if let imageURL = movie.posterPath {
                TMDBImageView(url: "\(Constants.shared.imageURL+imageURL)")
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .cornerRadius(10)
                    .clipShape(Circle())
            }
            
            Text(movie.title ?? "")
                .fontWeight(.semibold)
                .font(.system(size: 10))
                .frame(width: 64, height: 30)
                .foregroundStyle(Color(Constants.shared.color))
                .truncationMode(.tail)
        }
        Spacer()
    }
}
