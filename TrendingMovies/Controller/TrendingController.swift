//
//  ViewController.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 13/06/2023.
//

import UIKit
import Kingfisher

class TrendingController: UIViewController {
    
    // Outlet
    @IBOutlet weak var TrendingTableView: UITableView!
    
    // Movies list from service
    var movies: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from service
        TrendingService().getTrendingRequest { movieList in
            self.movies = movieList
            self.TrendingTableView.reloadData()
        }
        // Assignment TableView data source
        TrendingTableView.dataSource = self
        
        // Register Nib cell reference
        TrendingTableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "listCell")
    }


}

// MARK: - Extension for TableView data source

extension TrendingController: UITableViewDataSource {
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    // Resuable Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // init cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        // Update data in table
            let mv = self.movies[indexPath.row]
            cell.titleLabel.text = mv.title
            cell.orgTitleLabel.text = mv.originalTitle
            if let year = mv.releaseDate, let score = mv.voteAverage, let genre = mv.genreIDS {
                cell.yearLabel.text = String(year.dropLast(6))
                cell.scoreLabel.text = String(format: "%.1f", score)
                cell.genereLabel.text = Genre.getName(genreNum: genre[0])
            }
            
            
            // Download image with using kingfisher
            if let poster = mv.posterPath {
                let urlString = "https://image.tmdb.org/t/p/w500\(poster)"
                let url = URL(string: urlString)
                cell.posterImage.kf.indicatorType = .activity
                cell.posterImage.kf.setImage(with: url)
            }
            
        
        return cell
    }
    
    
}



