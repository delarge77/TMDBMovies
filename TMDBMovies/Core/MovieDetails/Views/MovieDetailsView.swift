//
//  MovieDetailsView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-19.
//

import SwiftUI
import SwiftData

struct MovieDetailsView: View {
    
    let movie: Movie
    
    init(for movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        HStack{
            Text(movie.title ?? "")
                .fontWeight(.semibold)
                .font(.subheadline)
            
            Button(action: {
                if movie.isFavourite == false {
                    movie.isFavourite = true
                } else if movie.isFavourite == true {
                    movie.isFavourite = false
                }
            }, label: {
                Image(systemName: movie.isFavourite == true ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(movie.isFavourite == true ? .red : Color(Constants.shared.color))
            })
        }
        
        VStack {
            
            ScrollView() {
                VStack {
                    if let imageURL = movie.posterPath {
                        TMDBImageView(url: "\(Constants.shared.imageURL+imageURL)")
                            .scaledToFill()
                            .frame(width: 360, height: 500)
                            .cornerRadius(10)
                            .clipShape(Rectangle())
                    }
                    Text(movie.overview ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(width: 320)
                            .foregroundStyle(Color(Constants.shared.color))
                            .truncationMode(.tail)
                            .padding()
                    
                    Spacer()
                    
                }
            }
        }
    }
}

//#Preview {
//    MovieDetailsView(movie:)
//}
