//
//  MovieResponse.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieResponse:Mappable{
    var page : Int?
    var movies : Array<Movie>?
    var total_results : Int?
    var total_pages : Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        page                <- map["page"]
        movies             <- map["results"]
        total_results       <- map["total_results"]
        total_pages         <- map["total_pages"]
    }
}
