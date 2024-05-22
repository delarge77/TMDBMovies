//
//  ImageLoader.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import Foundation

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?
    private let url: String
    
    init(url: String) {
        self.url = url
        Task { await loadImage() }
    }
    
    @MainActor
    private func loadImage() async {
        
        if let cached = ImageCache.shared.get(forKey: url) {
            self.image = Image(uiImage: cached)
            return
        }
        guard let url = URL(string: url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return }
            self.image = Image(uiImage: uiImage)
        } catch {
            print("Error")
        }
    }
}

