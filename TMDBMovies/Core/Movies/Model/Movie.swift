//
//  Movie.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-17.
//

import Foundation
import SwiftData

@Model
class PopularPage: Codable, Identifiable, Hashable {
    @Attribute(.unique) let page: Int
    let popularMovies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.popularMovies = try container.decode([Movie].self, forKey: .movies)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
    }
    
    func encode(to encoder: any Encoder) throws {
        //Handle encoding if required
    }
}

@Model
class TopRatedPage: Codable, Identifiable, Hashable {
    @Attribute(.unique)let page: Int
    let topRatedMovies: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.topRatedMovies = try container.decode([Movie].self, forKey: .movies)
        self.totalPages = try container.decode(Int.self, forKey: .totalPages)
        self.totalResults = try container.decode(Int.self, forKey: .totalResults)
    }
    
    func encode(to encoder: any Encoder) throws {
        //Handle encoding if required
    }
}

@Model
class Movie: Codable, Identifiable, Hashable {
    @Attribute(.unique) let id: Int
    let overview: String?
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    var isFavourite: Bool
    
    enum CodingKeys: String, CodingKey {
        case overview, title, id
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        self.isFavourite = false // adding custom parameter, preferably should come from API, but using for SwiftData purposes
    }
    
    
    init(id: Int, overview: String?, title: String?, posterPath: String?, releaseDate: String, isFavourite: Bool) {
        self.id = id
        self.overview = overview
        self.title = title
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.isFavourite = isFavourite
    }
    
    func encode(to encoder: any Encoder) throws {
        //Handle encoding if required
    }
}

