//
//  HomeViewModel.swift
//  Movie_team6_M
//
//  Created by saja khalid on 04/07/1447 AH.
//


import SwiftUI
import Combine


final class HomeViewModel: ObservableObject {

    @Published var searchText: String = ""   // ✅ هذا السطر مهم

    @Published var topRatedMovies: [Movie] = [
        Movie(title: "Inception", image: "movie1", rating: 8.8),
        Movie(title: "Interstellar", image: "movie2", rating: 8.6),
        Movie(title: "Oppenheimer", image: "movie3", rating: 8.5)
    ]

    let categories: [String] = ["Drama", "Comedy"]

    let moviesByCategory: [String: [Movie]] = [
        "Drama": [
            Movie(title: "Inception", image: "movie1", rating: 8.8)
        ],
        "Comedy": [
            Movie(title: "Interstellar", image: "movie2", rating: 8.6)
        ]
    ]
}
