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
        TrendingService().sendUpcomingMoviesRequest()
        // Assignment TableView data source
        TrendingTableView.dataSource = self
        
        // Register Nib cell reference
        TrendingTableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "listCell")
    }


}

// Extension for TableView data source
extension TrendingController: UITableViewDataSource {
    
    // Number of Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Resuable Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
        
        // Sample cell data
        cell.titleLabel.text = "Tytuł testowy"
        cell.orgTitleLabel.text = "OrgTitle test"
        cell.scoreLabel.text = "0,0"
        cell.yearLabel.text = "2023"
        cell.genereLabel.text = "Akcja"
        cell.posterImage.image = UIImage(named: "AppIcon")
        
        return cell
    }
    
    
}



