//
//  MainTabView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-27.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            MoviesView()
            .tabItem {
                Label("Movies", systemImage: "person.crop.circle.fill")
            }
            
            FavoritesView()
            .tabItem {
                Label("Favorites", systemImage: "person.crop.circle.fill")
            }
        }
    }
}

#Preview {
    MainTabView()
}
