//
//  MovieApiService.swift
//  MovieList
//
//  Created by ctsuser1 on 5/3/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import Alamofire

class MovieApiService{
    
    private struct Constants{
        
        static let apikey = "18ceab2d3423beabb428e1e1a1da9735"
        static let baseURL = ""
    }
    
    class func GET( _ url:String, success: (_ json:String) -> (), onError:(_ error:String)->()){
        
        Alamofire.request(url).responseJSON{response in
            
        
    }
    }
}
