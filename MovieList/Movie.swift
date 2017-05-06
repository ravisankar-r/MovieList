//
//  Movie.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie :Mappable{
    var poster_path : String?
    var adult : String?
    var overview : String?
    var release_date : String?
    var genre_ids : Array<Int>?
    var id : Int?
    var original_title : String?
    var original_language : String?
    var title : String?
    var backdrop_path : String?
    var popularity : Double?
    var vote_count : Int?
    var video : String?
    var vote_average : Double?
    
    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        poster_path         <- map["poster_path"]
        adult               <- map["adult"]
        overview            <- map["overview"]
        release_date        <- map["release_date"]
        genre_ids           <- map["genre_ids"]
        id                  <- map["id"]
        original_title      <- map["original_title"]
        original_language   <- map["original_language"]
        title               <- map["title"]
        backdrop_path       <- map["backdrop_path"]
        popularity          <- map["popularity"]
        vote_count          <- map["vote_count"]
        video               <- map["video"]
        vote_average        <- map["vote_average"]
    }
}
