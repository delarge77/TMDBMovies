//
//  MockMoviesDataService.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation

class MockMoviesDataService: MovieDataServiceProtocol {
    
    var mockData: Data?
    var mockError: NetworkAPIError?
    
    func fecthTopRatedMoviesPage() async throws -> TopRatedPage {
        
        if let mockError { throw mockError }
        
        do {
            let movies = try JSONDecoder().decode(TopRatedPage.self, from: mockData ?? mockMoviesData_top_rated)
            return movies
        } catch {
            throw error as? NetworkAPIError ?? .unknownError(error: error)
        }
        
    }
    
    func fecthMostPopularMoviesPage() async throws -> PopularPage {
        if let mockError { throw mockError }
        
        do {
            let movies = try JSONDecoder().decode(PopularPage.self, from: mockData ?? mockMoviesData_top_rated)
            return movies
        } catch {
            throw error as? NetworkAPIError ?? .unknownError(error: error)
        }
    }
}

