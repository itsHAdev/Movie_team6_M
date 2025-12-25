//
//  CategoryMoviesView.swift
//  Movie_team6_M
//
//  Created by saja khalid on 04/07/1447 AH.
//

import SwiftUI
struct CategoryMoviesView: View {

    let title: String
    let movies: [Movie]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 218), spacing: 16)],
                spacing: 26
            ) {
                ForEach(movies) { movie in
                    MovieCardView(movie: movie)
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
