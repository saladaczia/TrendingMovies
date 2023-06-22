//
//  DetailController.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 22/06/2023.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var backImage: UIImageView!
    
    var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let inputID = movieID {
            DetailService().getDetailRequest(iD: inputID) { [self] detail in
                if let backdropPath = detail.backdropPath {
                    let urlString = "https://image.tmdb.org/t/p/w500\(backdropPath)"
                    let url = URL(string: urlString)
                    backImage.kf.indicatorType = .activity
                    backImage.kf.setImage(with: url)
                }
            }
        }
print(movieID!)
        // Do any additional setup after loading the view.
    }
    

    

}
