//
//  Movie.swift
//  Movie_team6_M
//
//  Created by saja khalid on 04/07/1447 AH.
//


import SwiftUI
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let rating: Double
}
