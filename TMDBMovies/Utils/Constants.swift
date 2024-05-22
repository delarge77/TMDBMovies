//
//  Constants.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import Foundation

struct Constants {
    
    static let shared = Constants()
    private init() { }
    
    var imageURL: String {
        return "https://image.tmdb.org/t/p/w300/"
    }
    
    // Could use only primary or secondary color since I am using only black and white colours
    var color: String {
        return "TMDBColor"
    }
}
