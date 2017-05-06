//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by ctsuser1 on 5/5/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController : UIViewController {
    
    @IBOutlet weak var imageViewBackDrop : UIImageView!
    @IBOutlet weak var imageViewPoster : UIImageView!
    @IBOutlet weak var labelMovieTitle : UILabel!
    @IBOutlet weak var labelMovieReleaseDate : UILabel!
    @IBOutlet weak var labelMovieOverView : UILabel!
    @IBOutlet weak var labelMovieRating : UILabel!
    
    var viewModel:DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel(){
        
        imageViewPoster.downloadedFrom(link: (viewModel?.imageURL)!)
        imageViewBackDrop.downloadedFrom(link: (viewModel?.backDropImageURL)!)
        labelMovieTitle.text = viewModel?.movie.title
        labelMovieReleaseDate.text = viewModel?.movie.release_date
        labelMovieOverView.text = viewModel?.movie.overview
        labelMovieRating.text = viewModel?.rating
    }
 
    
}

