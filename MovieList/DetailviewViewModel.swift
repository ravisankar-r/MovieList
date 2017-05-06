//
//  DetailviewViewModel.swift
//  MovieList
//
//  Created by ctsuser1 on 5/5/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation

class DetailViewModel : MovieViewModel{
    

    var rating: String {
        
        return String(format:"%.1f",self.movie.vote_average!)
    }
    
    var movie : Movie
    
    var imageURL : String{
        
        return TMDBConfig.thumbnailImageURL(self.movie.poster_path ?? "")
    }
    
    var backDropImageURL : String {
        
        return TMDBConfig.backDropImageURL(self.movie.backdrop_path ?? "")
    }
    
    init(movie:Movie){
        
        self.movie = movie
        
    }

}
