//
//  MostPopularMoviesView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import SwiftUI

struct MostPopularMoviesView: View {
    
    let movie: Movie
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let imageURL = movie.posterPath {
                TMDBImageView(url: "\(Constants.shared.imageURL+imageURL)")
                    .scaledToFill()
                    .frame(width: 360, height: 150)
                    .cornerRadius(10)
                    .clipShape(Rectangle())
            }
            
            VStack(alignment: .leading) {
                Text("\(movie.title ?? "")")
                    .fontWeight(.bold)
                    .foregroundStyle(Color(Constants.shared.color))
                HStack {
                    Text(LocalizedStringResource(stringLiteral: "Release Date: "))
                        .foregroundStyle(Color(.gray))
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(movie.releaseDate ?? "")
                        .foregroundStyle(Color(.gray))
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
            }
            .font(.subheadline)
        }
    }
    
}
