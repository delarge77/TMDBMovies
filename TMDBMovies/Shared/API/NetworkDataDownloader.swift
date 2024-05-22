//
//  NetworkDataDownloader.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation

protocol NetworkDataDownloader {
    func fecthData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

extension NetworkDataDownloader {
    
    // Make language as parameter
    public var baseURLComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3"
        components.queryItems = [
            .init(name: "language", value: "en-US")
        ]
        return components
    }
    
    func fecthData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetworkAPIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(privateKey())", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.timeoutInterval = 10.0
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkAPIError.requestFailed(description: "Request failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw error as? NetworkAPIError ?? .unknownError(error: error)
        }
    }
    
    // Save API KEY on keychain
    private func privateKey() -> String {
        return "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTI4YTA4MDllNjJmNDI5NzQ1MTViZmI1OGYxYmNlNCIsInN1YiI6IjY2NDY0Yjc4MjMzNThiMWE5NDNiMDE2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G6-PlppreHmMgT_yIUotmjMTZfXf-v7-xT-QvhAqLfI"
    }
}

