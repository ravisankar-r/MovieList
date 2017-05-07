//
//  MovieTableViewViewModelTests.swift
//  MovieList
//
//  Created by ctsuser1 on 5/6/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
@testable import MovieList

class MoviesTableViewViewModelTests: XCTestCase {
    
    // MARK: - getMovie
    func testNormalMovieCells() {
        let mockService = MockNetworkService()
        mockService.getMoviesResult = .success(payload:MovieResponse.mockMovieResponse())
        
        let viewModel = MoviesTableViewViewModel(tmdbService: mockService)
        viewModel.getMovies(pageIndex: 1, requestTrigger: .filter)
        
        guard case .some(.normal(_)) = viewModel.movieCells.value.first else {
            XCTFail()
            return
        }
    }
    
}

private final class MockNetworkService: TMDBNetworkService {
    
    var getMoviesResult: TMDBNetworkService.GetMoviesResult?
    
    
    override func getMovies(pageIndex: Int, minYear: String, maxYear: String, completion: @escaping TMDBNetworkService.GetMoviesCompletion) {
        
        completion(getMoviesResult!)
    }
    
    
}
