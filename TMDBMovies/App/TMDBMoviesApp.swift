//
//  TMDBMoviesApp.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import SwiftUI
import SwiftData

@main
struct TMDBMoviesApp: App {
    
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            MoviesView()
                .environmentObject(MoviesViewModel(service: MovieDataService(), modelContext: container.mainContext))
                .modelContainer(container)
        }
    }
    
    init() {
        do {
            container = try ModelContainer(for: Movie.self, PopularPage.self, TopRatedPage.self)
        } catch {
            fatalError("Failed to create model container for Movie")
        }
        
    }
}
