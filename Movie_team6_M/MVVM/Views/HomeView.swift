//
//  HomeView.swift
//  Movie_team6_M
//
//  Created by saja khalid on 04/07/1447 AH.
//


import SwiftUI
struct HomeView: View {

    @StateObject private var vm = HomeViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {

                    SearchBarView(
                        text: $vm.searchText
                    )

                    TopRatedSection(
                        movies: vm.topRatedMovies
                    )

                    ForEach(vm.categories, id: \.self) { category in
                        CategorySection(
                            title: category,
                            movies: vm.moviesByCategory[category] ?? []
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Movies")
        }
    }
}
struct SectionHeaderView: View {

    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            Spacer()
        }
        .padding(.horizontal, 4)
    }
}
struct SearchBarView: View {

    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search movies", text: $text)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(14)
    }
}
struct TopRatedSection: View {

    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: "Top Rated")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(movies) { movie in
                        MovieCardView(movie: movie)
                    }
                }
            }
        }
    }
}
struct CategorySection: View {

    let title: String
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            SectionHeaderView(title: title)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                ForEach(movies) { movie in
                    MovieCardView(movie: movie)
                }
            }
        }
    }
}
