//
//  TMDBHeader.swift
//  TMDBMovies
//
//  Created by Alessandro dos Santos Pinto on 2024-05-20.
//

import Foundation
import SwiftUI

struct TMDBHeader: View {

    let title: String
    
    var body: some View {
        Text(LocalizedStringResource(stringLiteral: title))
            .fontWeight(.bold)
            .font(.title2)
            .padding()
            .foregroundStyle(Color(Constants.shared.color))
            .frame(height: 20)
        
    }
}
