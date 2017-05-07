//
//  MockMovieResponse.swift
//  MovieList
//
//  Created by ctsuser1 on 5/6/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import XCTest
import ObjectMapper
@testable import MovieList

extension MovieResponse {
    
static func mockMovieResponse() -> MovieResponse {
    
    let url = Bundle.main.url(forResource: "MovieResponse", withExtension: "json")!
    
    // Load Data
    let data = try! Data(contentsOf: url)
    
    // Deserialize JSON
    let json = try! JSONSerialization.jsonObject(with: data, options: [])
    let movieResponse = Mapper<MovieResponse>().map(JSON: json as! [String : Any])
    
    return movieResponse!
}
    
}
