//
//  TMDBNetworkService.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class TMDBNetworkService{
    
    enum GetMoviesResultFailureCodes: Int,Error{
        
        case notFound = 404
    }
    
    typealias GetMoviesResult = Result<MovieResponse,GetMoviesResultFailureCodes>
    typealias GetMoviesCompletion = (_ result : GetMoviesResult)-> Void
    
    func getMovies(pageIndex:Int,minYear:String,maxYear:String,completion : @escaping GetMoviesCompletion){
        
        var urlParams = [
            "api_key":TMDBConfig.API_KEY,
            "sort_by":"popularity.desc",
            "page":String(pageIndex)
            ]
        
        if minYear != "0" && maxYear != "0"  {
                urlParams["primary_release_date.gte"]=minYear
                urlParams["primary_release_date.lte"]=maxYear
        }
        
        Alamofire.request(TMDBConfig.TMDB_GET_MOVIES_URL, method: .get, parameters: urlParams)
                 .validate()
            .responseObject{ (response: DataResponse<MovieResponse>) in
                
                switch response.result{
                case .success:
                    guard let movieResponse = response.result.value else{
                        completion(.failure(nil))
                        return
                    }
                    completion(.success(payload: movieResponse))
                case .failure:
                    if let statusCode = response.response?.statusCode,
                        let reason = GetMoviesResultFailureCodes(rawValue:statusCode){
                        completion(.failure(reason))
                    }
                    completion(.failure(nil))
                }
        }
    }
}
