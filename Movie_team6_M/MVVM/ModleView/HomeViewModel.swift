//
//  HomeViewModel.swift
//  Movie_team6_M
//
//  Created by saja khalid on 04/07/1447 AH.
//


import SwiftUI
import Combine


final class HomeViewModel: ObservableObject {

    // 🔍 Search
    @Published var searchText: String = ""

    // ⭐ Top Rated
    @Published var topRatedMovies: [Movie] = [

        Movie(
            title: "Inception",
            image: "Image1",
            rating: 4.8,
            duration: "2h 28m",
            language: "English",
            genre: "Sci-Fi",
            age: "+13",
            story: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.",
            imdbRating: "8.8/10",
            director: "Christopher Nolan",
            stars: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page"]
        ),

        Movie(
            title: "Interstellar",
            image: "Image2",
            rating: 4.6,
            duration: "2h 49m",
            language: "English",
            genre: "Adventure",
            age: "+10",
            story: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
            imdbRating: "8.6/10",
            director: "Christopher Nolan",
            stars: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"]
        ),

        Movie(
            title: "Oppenheimer",
            image: "Image3",
            rating: 4.5,
            duration: "3h",
            language: "English",
            genre: "Drama",
            age: "+16",
            story: "The story of J. Robert Oppenheimer and the creation of the atomic bomb.",
            imdbRating: "8.4/10",
            director: "Christopher Nolan",
            stars: ["Cillian Murphy", "Emily Blunt", "Robert Downey Jr."]
        )
    ]

    // 🎬 Categories
    let categories: [String] = ["Drama", "Sci-Fi"]

    let moviesByCategory: [String: [Movie]] = [

        "Drama": [
            Movie(
                title: "Oppenheimer",
                image: "Image3",
                rating: 4.5,
                duration: "3h",
                language: "English",
                genre: "Drama",
                age: "+16",
                story: "The story of J. Robert Oppenheimer and the creation of the atomic bomb.",
                imdbRating: "8.4/10",
                director: "Christopher Nolan",
                stars: ["Cillian Murphy", "Emily Blunt"]
            ),
            Movie(
                title: "Interstellar",
                image: "Image2",
                rating: 4.6,
                duration: "2h 49m",
                language: "English",
                genre: "Adventure",
                age: "+10",
                story: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                imdbRating: "8.6/10",
                director: "Christopher Nolan",
                stars: ["Matthew McConaughey"]
            ),
            Movie(
                title: "Oppenheimer",
                image: "Image3",
                rating: 4.5,
                duration: "3h",
                language: "English",
                genre: "Drama",
                age: "+16",
                story: "The story of J. Robert Oppenheimer and the creation of the atomic bomb.",
                imdbRating: "8.4/10",
                director: "Christopher Nolan",
                stars: ["Cillian Murphy", "Emily Blunt"]
            )
        ],

        "Sci-Fi": [
            Movie(
                title: "Interstellar",
                image: "Image2",
                rating: 4.6,
                duration: "2h 49m",
                language: "English",
                genre: "Adventure",
                age: "+10",
                story: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                imdbRating: "8.6/10",
                director: "Christopher Nolan",
                stars: ["Matthew McConaughey"]
            ),
            Movie(
                title: "Inception",
                image: "Image1",
                rating: 4.8,
                duration: "2h 28m",
                language: "English",
                genre: "Sci-Fi",
                age: "+13",
                story: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.",
                imdbRating: "8.8/10",
                director: "Christopher Nolan",
                stars: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page"]
            )
        ]
    ]
}
