//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by ctsuser1 on 5/4/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import Foundation
import UIKit

class MovieTableViewCell : UITableViewCell{
    
    @IBOutlet weak var labelMovieTitle: UILabel!
    @IBOutlet weak var labelMovieOverview: UILabel!
    @IBOutlet weak var labelMovieReleaseDate: UILabel!
    @IBOutlet weak var imageViewMovieThumbNail : UIImageView!
    @IBOutlet weak var labelMovieRating : UILabel!
    
    var viewModel:MovieViewModel?{
        didSet{
            bindViewModel()
        }
    }
    
    private func bindViewModel(){
        
        labelMovieTitle?.text = viewModel?.movie.title
        labelMovieOverview?.text = viewModel?.movie.overview
        labelMovieReleaseDate?.text = viewModel?.movie.release_date
        labelMovieRating?.text = viewModel?.rating
        imageViewMovieThumbNail.downloadedFrom(link:(viewModel?.imageURL)!)
        
    }
}

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }}
