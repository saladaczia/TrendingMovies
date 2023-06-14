//
//  ViewController.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 13/06/2023.
//

import UIKit

class TrendingController: UIViewController {

    @IBOutlet weak var TrendingTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 20
    }
    
    // Resuable Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // init cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        
        
        cell.posterImage.image = UIImage(named: "AppIcon")
        // Update data in table
        TrendingService().getTrendingRequest { (movieList) in
            let mv = movieList[indexPath.row]
            cell.titleLabel.text = mv.title
            cell.orgTitleLabel.text = mv.originalTitle
            cell.yearLabel.text = String(mv.releaseDate!.dropLast(6))
            cell.scoreLabel.text = String(format: "%.1f", mv.voteAverage!)
            cell.genereLabel.text = Genre.getName(genreNum: mv.genreIDS![0])
            "print(mv.posterPath!) https://image.tmdb.org/t/p/w500"
        }
        return cell
    }
    
    
}



