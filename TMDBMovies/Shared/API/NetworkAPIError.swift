//
//  NetworkAPIError.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation

enum NetworkAPIError: Error {
    case invalidData
    case jsonParserFailure
    case requestFailed(description: String)
    case invalidURL
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
            case .invalidData: return "Invalid Data"
            case .jsonParserFailure: return "Failed to parse json"
            case let .requestFailed(description): return "Request failed: \(description)"
            case .invalidURL: return "Invalid URL"
            case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
            case let .unknownError(error): return "An unknown error ocurred: \(error.localizedDescription)"
        }
    }
}
