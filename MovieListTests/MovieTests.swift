//
//  MovieTests.swift
//  MovieList
//
//  Created by ctsuser1 on 5/6/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
@testable import MovieList

class MovieTests: XCTestCase {
    
    func testSuccessfulInit() {
        
        let jsonDictionary: [String: Any] = [
            "poster_path": "/qApDisHBcR0YwzYgMHHa3T9fSF1.jpg",
            "adult": false,
            "overview": "Experimental short film in which color patches are painted directly on film boxes",
            "release_date": "1940-01-01",
            "genre_ids": [
                16
            ],
            "id": 104398,
            "original_title": "Dots",
            "original_language": "en",
            "title": "Dots",
            "backdrop_path": "/qApDisHBcR0YwzYgMHHa3T9fSF1.jpg",
            "popularity": 1.000252,
            "vote_count": 5,
            "video": false,
            "vote_average": 4.8
            ]
        let movie = Mapper<Movie>().map(JSON: jsonDictionary)
        
        XCTAssertEqual(movie?.id, 104398)
        XCTAssertEqual(movie?.original_title, "Dots")
        XCTAssertEqual(movie?.release_date, "1940-01-01")
    }
}
