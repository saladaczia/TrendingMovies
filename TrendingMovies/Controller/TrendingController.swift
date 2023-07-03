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
    var idForDVC: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get data from service
        for numPage in 1...10 {
            TrendingService().getTrendingRequest(page: numPage) { movieList in
                self.movies += movieList
                self.TrendingTableView.reloadData()
            }
        }
        
        // Assignment TableView data source
        TrendingTableView.dataSource = self
        TrendingTableView.delegate = self
        
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
        if let year = mv.releaseDate, let score = mv.voteAverage, let genreID = mv.genreIDS {
            cell.yearLabel.text = String(year.dropLast(6))
            cell.scoreLabel.text = String(format: "%.1f", score)
            if let genre = genreID.first {
                cell.genereLabel.text = Genre.getName(genreNum: genre)
            }
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

// MARK: - Extension for TableView Delegate

extension TrendingController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idForDVC = self.movies[indexPath.row].id!
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TrendingController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let detailVC = segue.destination as! DetailController
            detailVC.movieID = idForDVC
        }
    }
}



