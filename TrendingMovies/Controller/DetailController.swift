//
//  DetailController.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 22/06/2023.
//

import UIKit

class DetailController: UIViewController {

    // Outlets
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var scoreVote: UILabel!
    @IBOutlet weak var voteAve: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var overviewLabel: UITextView!
    @IBOutlet weak var starImage: UIImageView!
    
    // movie ID from movie list
    var movieID: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting empty labels
        scoreVote.text = ""
        voteAve.text = ""
        titleLabel.text = ""
        detailLabel.text = ""
        overviewLabel.text = ""
        starImage.isHidden = true
        
        // Setting detail parameters
        if let inputID = movieID {
            DetailService().getDetailRequest(iD: inputID) { [self] detail in
                // Settings Image
                if let backdropPath = detail.backdropPath {
                    let urlString = "https://image.tmdb.org/t/p/w500\(backdropPath)"
                    let url = URL(string: urlString)
                    backImage.kf.indicatorType = .activity
                    backImage.kf.setImage(with: url)
               
                }
                // Setting vote labels
                    if let score = detail.voteAverage, let votes = detail.voteCount {
                        starImage.isHidden = false
                        scoreVote.text = String(format: "%.2f", score)
                        let votesString = String(votes)
                        voteAve.text = "| \(votesString)"
                    }
                    // Setting title
                    if let title = detail.title {
                        titleLabel.text = title
                    }
                    // Setting detail label
                    if let runTime = detail.runtime, let genre = detail.genres, let date = detail.releaseDate {
                        
                        if let genreName = genre.first {
                            let dateStr = String(date).dropLast(6)
                            detailLabel.text = "\(runTime) min • \(genreName.name!) • \(dateStr)"
                        }
                    }
                // setting overview label
                if let overview = detail.overview {
                    overviewLabel.text = overview
                }
            }
        }
        
        // Add gradient to image
        let view = UIView(frame: backImage.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)

        backImage.addSubview(view)
        backImage.bringSubviewToFront(view)
        
    }
    

    

}
