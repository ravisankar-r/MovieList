//
//  ViewController.swift
//  MovieList
//
//  Created by Ravi on 5/3/17.
//  Copyright © 2017 RaviSankar. All rights reserved.
//

import UIKit
import PKHUD

class MoviesTableViewController : UITableViewController , FilterViewDelegate{
    
    let viewModel : MoviesTableViewViewModel = MoviesTableViewViewModel()
    
    var indexOfPageRequest = 0
    var filter:(maxYear:String,minYear:String)?
    var filterEnabled = false
    var loadingStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 161
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadMovies()
    }
    
     func bindViewModel(){
        viewModel.movieCells.bindAndFire(){[weak self] _ in
            self?.tableView?.reloadData()
            self?.loadingStatus = false
        }
        viewModel.showLoadingIndicator.bind(){ visible in
            PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
            visible ? PKHUD.sharedHUD.show() : PKHUD.sharedHUD.hide()
            
        }
        
    }
    
    func loadMovies(){
        if !loadingStatus{
            loadingStatus = true
            // increments the number of the page to request
            indexOfPageRequest += 1
            guard let filterData = filter  else{
                
                viewModel.getMovies(pageIndex: indexOfPageRequest)
                return
            }
                viewModel.getMovies(pageIndex: indexOfPageRequest,minYear:filterData.minYear,maxYear:filterData.maxYear)
        }
}
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // calculates where the user is in the y-axis
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            
            // call your API for more data
            loadMovies()
            
            // tell the table view to reload with the new data
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "detailViewSegue"{
            let selectedIndexPath = tableView.indexPathForSelectedRow
            let destinationViewController = segue.destination as? MovieDetailViewController
            switch viewModel.movieCells.value[(selectedIndexPath?.row)!] {
            case .normal(let viewModel):
                destinationViewController?.viewModel = DetailViewModel(movie:viewModel.movie)
                case .empty, .error:
                // nop
                break
            }
        }
        if segue.identifier == "filterSegue"{
            
            let destinationViewController = segue.destination as? FilterViewController
            destinationViewController?.delegate = self
            if let filterValues = filter{
                destinationViewController?.filterValues = (filterValues.maxYear,filterValues.minYear)
            }
        }
    }
    
}

//MARK:- filterview delegate method

extension MoviesTableViewController{
    
    func onApplyFilterAction(maxYear: String, minYear: String) {
        
        indexOfPageRequest = 0
        filter = (maxYear,minYear)
        loadMovies()
    }
}
//MARK:- tableview datasource

extension MoviesTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieCells.value.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.movieCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell else{
                 return UITableViewCell()
            }
            cell.viewModel = viewModel
            return cell
        case .error(let message):
            let cell = UITableViewCell()
            cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UITableViewCell()
            cell.textLabel?.text = "No data"
            return cell
    
        }
    }
}
