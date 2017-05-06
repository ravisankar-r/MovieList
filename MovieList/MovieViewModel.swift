//
//  MovieCellViewModel.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

protocol MovieViewModel{
    
    var movie : Movie {get}
    var imageURL : String {get}
    var rating : String { get }
    var backDropImageURL : String { get }
    
}

extension Movie : MovieViewModel{
    
    var rating: String {
        
        return String(format:"%.1f",vote_average!)
    }
    
    var movie : Movie{
        
        return self
    }
    
    var imageURL : String{
        
      return TMDBConfig.thumbnailImageURL(poster_path ?? "")
    }
    
    var backDropImageURL : String {
        
        return TMDBConfig.backDropImageURL(backdrop_path!)
    }
    
    
}
