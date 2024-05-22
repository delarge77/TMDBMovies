//
//  TMDBImageView.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import Foundation


import SwiftUI

// In production app I would rather use a 3rd library for it as Kingfisher.
// But since its a demo app, I dont want to use any 3rd party library, besides I can show
// how a image cache/loader works behind the woods :-P
struct TMDBImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}

#Preview {
    TMDBImageView(url: "https://image.tmdb.org/t/p/w200/tMefBSflR6PGQLv7WvFPpKLZkyk.jpg")
}
