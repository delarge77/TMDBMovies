//
//  TMDBViewModelTests.swift
//  TMDBMoviesTests
//
//  Created by Alessandro dos Santos Pinto on 2024-05-22.
//

import XCTest
@testable import TMDBMovies

final class TMDBViewModelTests: XCTestCase {

    func testInit() {
        let service = MockMoviesDataService()
        let viewModel = MoviesViewModel(service: service, modelContext: nil)
        XCTAssertNotNil(viewModel, "viewModel should not be nil")
    }
    
    

}
