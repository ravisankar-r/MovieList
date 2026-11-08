//
//  TMDBConstants.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation

class TMDBConfig {
    
    static var TMDB_GET_MOVIES_URL = "https://api.themoviedb.org/3/discover/movie"
    
    static var IMAGE_BASE_URL = "https://image.tmdb.org/t/p/"
    
    // Set in Secrets.xcconfig (not committed), passed through Info.plist at build time.
    static var API_KEY: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "TMDBApiKey") as? String, !key.isEmpty else {
            fatalError("TMDB_API_KEY is empty. Copy Secrets.xcconfig.example to Secrets.xcconfig and set your key.")
        }
        return key
    }
    
        
    static func thumbnailImageURL(_ poster_path:String)->String{
        return "\(IMAGE_BASE_URL)w342\(poster_path)"
    }
    static func backDropImageURL(_ backdrop_path:String)->String{
        return "\(IMAGE_BASE_URL)w1000\(backdrop_path)"
    }
    
}
