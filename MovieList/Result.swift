//
//  Result.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

enum Result<T,U> where U : Error {
    
    case success (payload:T)
    case failure (U?)
}
