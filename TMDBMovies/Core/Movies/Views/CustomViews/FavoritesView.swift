//
//  FavoritesView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-21.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Environment(\.modelContext) var context
    let service: MovieDataServiceProtocol
    
    init(service: MovieDataServiceProtocol) {
        self.service = service
    }
    
    @Query(filter: #Predicate<Movie> { movie in
        movie.isFavourite == true
    }) var favoriteMovies: [Movie]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteMovies) { movie in
                    FavoritesMoviesListView(movie: movie)
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let movie = favoriteMovies[index]
                        movie.isFavourite = false
                    }
                }
            }
            .navigationTitle("Favorite Movies")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

//#Preview {
//    FavoritesView()
//}
