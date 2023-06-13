//
//  TrendingService.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 13/06/2023.
//

import Foundation
import Alamofire

struct TrendingService {
    
    func sendUpcomingMoviesRequest() {

        // Add Headers
        let headers: HTTPHeaders = [
            "Accept":"application/json",
            "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZmE0Y2IxNzhmODdiNjIzODAxYTEyMjNmMjFhNTU1ZCIsInN1YiI6IjYyNTcyNDM0OWE5ZTIwMDA5YjA0ZTAyYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QD7lG9kB5xr7B3Zo_OxQ43OTwHoBdQLsR_YFw5iTmRQ",
        ]

        // Add URL parameters
        let urlParams = [
            "language":"pl-PL",
            "page":"1",
        ]

        AF.request("https://api.themoviedb.org/3/movie/popular", method: .get, parameters: urlParams, headers: headers)
          .validate()
          .responseDecodable(of: TrendingModel.self) { (response) in
            guard let trending = response.value else { return }
              print(trending.results![0].title)
          }

        
    }
    
}
