//
//  Genre.swift
//  TrendingMovies
//
//  Created by Maciej Sołoducha on 14/06/2023.
//

import Foundation

struct Genre {
    static func getName(genreNum: Int) -> String {
        switch genreNum {
        case 28:
            return "Akcja"
        case 12:
            return "Przygodowy"
        case 16:
            return "Animacja"
        case 35:
            return "Komedia"
        case 80:
            return "Kryminał"
        case 99:
            return "Dokumentalny"
        case 18:
            return "Dramat"
        case 10751:
            return "Familijny"
        case 14:
            return "Fantasy"
        case 36:
            return "Historyczny"
        case 27:
            return "Horror"
        case 10402:
            return "Muzyczny"
        case 19648:
            return "Tajemnica"
        case 10749:
            return "Romans"
        case 878:
            return "Sci-Fi"
        case 10770:
            return "film TV"
        case 53:
            return "Thiller"
        case 10752:
            return "Wojenny"
        case 37:
            return "Western"
        default:
            return "Inny"
        }
    }
}
