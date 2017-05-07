//
//  MoviesTableViewViewModel.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation


class MoviesTableViewViewModel{
    
    enum MovieTableViewCellType{
        
        case normal(cellViewModel:MovieViewModel)
        case error(message:String)
        case empty
        
    }
    
    var showLoadingIndicator : Bindable = Bindable(false)
    
    let movieCells = Bindable([MovieTableViewCellType]())
    let tmdbService: TMDBNetworkService
    
    init(tmdbService: TMDBNetworkService = TMDBNetworkService()) {
        self.tmdbService = tmdbService
    }
    
    func getMovies(pageIndex:Int,minYear:String="0",maxYear:String="0",requestTrigger : GetMoviesActionTrigger){
        
        showLoadingIndicator.value = true
        tmdbService.getMovies(pageIndex: pageIndex,minYear:minYear,maxYear: maxYear,completion: {[weak self] result in
        
            self?.showLoadingIndicator.value = false
            switch result{
                
            case .success(let movieResponse):
                guard (movieResponse.movies?.count)! > 0 else{
                
                    return
                }
                if requestTrigger == .scroll{
                    self?.movieCells.value.append(contentsOf: (movieResponse.movies?.flatMap{.normal(cellViewModel:$0 as MovieViewModel)})!)
                }else {
                    self?.movieCells.value = (movieResponse.movies?.flatMap{.normal(cellViewModel:$0 as MovieViewModel)})!
                }
               
            case .failure(let error):
            self?.movieCells.value = [.error(message:error?.getErrorMessage() ?? "Loading failed")]
            }
        })
        
    }
    
}


fileprivate extension TMDBNetworkService.GetMoviesResultFailureCodes {
        func getErrorMessage() -> String? {
            switch self {
            case .notFound:
                return "Could not complete request, please try again."
            }
        }
}
