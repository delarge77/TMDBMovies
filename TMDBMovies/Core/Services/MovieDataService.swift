//
//  MovieDataService.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation

protocol MovieDataServiceProtocol {
    func fecthTopRatedMoviesPage() async throws -> TopRatedPage
    func fecthMostPopularMoviesPage() async throws -> PopularPage
}

class MovieDataService: NetworkDataDownloader, MovieDataServiceProtocol {
    
    private var topRatedURL: String? {
        var components = baseURLComponents
        components.path += "/movie/top_rated"
        return components.url?.absoluteString
    }
    
    private var popularMoviesURL: String? {
        var components = baseURLComponents
        components.path += "/movie/popular"
        return components.url?.absoluteString
    }
    
    func movieDetailsURLString(movieId: String) -> String? {
        var components = baseURLComponents
        components.path += "/movie/\(movieId)"
        return components.url?.absoluteString
    }
    
    func fecthTopRatedMoviesPage() async throws -> TopRatedPage {
        guard let endpoint = topRatedURL else {
            throw NetworkAPIError.invalidURL
        }
        return try await fecthData(as: TopRatedPage.self, endpoint: endpoint)
    }
    
    func fecthMostPopularMoviesPage() async throws -> PopularPage {
        guard let endpoint = popularMoviesURL else {
            throw NetworkAPIError.invalidURL
        }
        return try await fecthData(as: PopularPage.self, endpoint: endpoint)
    }
}
