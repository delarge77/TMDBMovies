//
//  ImageCache.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    private init() { }
    
    func set(_ image: UIImage, forkey key: String) {
        cache.setObject(image as UIImage, forKey: key as NSString)
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
}

