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
    
    static var API_KEY = "18ceab2d3423beabb428e1e1a1da9735"
    
        
    static func thumbnailImageURL(_ poster_path:String)->String{
        return "\(IMAGE_BASE_URL)w342\(poster_path)"
    }
    static func backDropImageURL(_ backdrop_path:String)->String{
        return "\(IMAGE_BASE_URL)w1000\(backdrop_path)"
    }
    
}
