//
//  MovieViewModel.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation
import SwiftUI
import SwiftData

class MoviesViewModel: ObservableObject {
    
    @Published var errorMessage: String?
    
    var modelContext: ModelContext?
    public let service: MovieDataServiceProtocol
    
    init(service: MovieDataServiceProtocol, modelContext: ModelContext?) {
        self.service = service
        self.modelContext = modelContext
    }
    
    
    @MainActor
    func fecthTopRatedMoviesPage() async {
        do {
            let page = try await service.fecthTopRatedMoviesPage()
            modelContext?.insert(page)
        } catch {
            guard let error = error as? NetworkAPIError else { return }
            self.errorMessage = error.localizedDescription
        }
    }
    
    @MainActor
    func fecthMostPopularMoviesPage() async {
        do {
            let page = try await service.fecthMostPopularMoviesPage()
            modelContext?.insert(page)
        } catch {
            guard let error = error as? NetworkAPIError else { return }
            self.errorMessage = error.customDescription
        }
    }
}
