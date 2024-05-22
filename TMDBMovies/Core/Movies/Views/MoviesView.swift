//
//  ContentView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import SwiftUI
import SwiftData

struct MoviesView: View {

    private let service: MovieDataServiceProtocol
    @EnvironmentObject var viewModel: MoviesViewModel
    @State private var isOn: Bool = false
    @Environment(\.colorScheme) private var colorScheme
    @State private var viewColorScheme: ColorScheme = .light
    @Query var popularPageFromDB: [PopularPage]
    @Query var topRatedPageFromDB: [TopRatedPage]
    
    
    
    init(service: MovieDataServiceProtocol) {
        self.service = service
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                Toggle("", isOn: $isOn).tint(Color(Constants.shared.color))
                HStack (){
                    TMDBHeader(title: "Top Rated Movies")
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    ScrollView( .horizontal, showsIndicators: false) {
                        HStack {
                            if let topMovies = topRatedPageFromDB.first?.topRatedMovies {
                                ForEach(topMovies) { movie in
                                    ScrollView ( .horizontal, showsIndicators: false){
                                        NavigationLink(value: movie) {
                                            HStack {
                                                TopRatedMoviesView(movie: movie)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                ScrollView {
                    VStack (alignment: .leading){
                        TMDBHeader(title: "Most popular Movies")
                        if let popularMovies = popularPageFromDB.first?.popularMovies {
                            ForEach(popularMovies) { movie in
                                    NavigationLink(value: movie) {
                                        VStack (alignment: .leading, spacing: 24){
                                            MostPopularMoviesView(movie: movie)
                                        }
                                        .padding()
                                    }
                                }
                            .navigationDestination(for: Movie.self) { movie in
                                MovieDetailsView(for: movie)
                            }
                        }
                    }
                }
            }
            .preferredColorScheme(viewColorScheme)
            .onChange(of: isOn, { _, newValue in
                viewColorScheme = newValue == false ? .dark : .light
            })
            .onAppear{
                switchAppearance()
            }
            .task {
                
                if topRatedPageFromDB.isEmpty {
                    await viewModel.fecthTopRatedMoviesPage()
                }
                
                if popularPageFromDB.isEmpty {
                    await viewModel.fecthMostPopularMoviesPage()
                }
            }
            .tabItem {
                Label("Movies", systemImage: "person.crop.circle.fill")
            }
            
            FavoritesView(service: service)
                .tabItem {
                    Label("Favorites", systemImage: "person.crop.circle.fill")
                }
        }
        .overlay{
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
        
    
    func switchAppearance() {
        viewColorScheme = colorScheme
        if colorScheme == .light {
            isOn = true
            return
        }
        
        isOn = false
    }
}

#Preview {
    MoviesView(service: MockMoviesDataService())
}
