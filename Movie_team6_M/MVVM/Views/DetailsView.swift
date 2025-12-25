////
////  DetailsView.swift
////  Movie_team6_M
////
////  Created by Hadeel Alansari on 24/12/2025.

import SwiftUI

struct DetailsView: View {

    let movie: Movie
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {

            ZStack(alignment: .topLeading) {

                // MARK: - Poster
                Image(movie.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 444)
                    .clipped()
                    .ignoresSafeArea(edges: .top)

                LinearGradient(
                    colors: [.black.opacity(0.9), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 444)

                // MARK: - Content
                VStack(alignment: .leading, spacing: 24) {

                    Spacer().frame(height: 120)

                    Text(movie.title)
                        .font(.title.bold())
                        .foregroundColor(.white)

                    HStack {
                        MovieInfo(title: "Duration", value: movie.duration)
                        Spacer()
                        MovieInfo(title: "Language", value: movie.language)
                    }

                    HStack {
                        MovieInfo(title: "Genre", value: movie.genre)
                        Spacer()
                        MovieInfo(title: "Age", value: movie.age)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Story")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)

                        Text(movie.story)
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("IMDb Rating")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)

                        Text(movie.imdbRating)
                            .foregroundColor(.gray)
                    }

                    Divider().background(.gray)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Director")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)

                        Text(movie.director)
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Stars")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)

                        HStack(spacing: 24) {
                            ForEach(movie.stars, id: \.self) { star in
                                VStack(spacing: 8) {
                                    Color.gray
                                        .frame(width: 76, height: 76)
                                        .clipShape(Circle())

                                    Text(star)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14))
                                }
                            }
                        }
                    }

                    Divider().background(.gray)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Rating & Reviews")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)

                        Text(String(format: "%.1f", movie.rating))
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.gray)

                        Text("out of 5")
                            .foregroundColor(.gray)
                    }

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 16)
                .padding(.top, 200)
            }
        }
        .ignoresSafeArea()

        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.yellow)
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.yellow)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "bookmark")
                    .foregroundColor(.yellow)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: - Component

struct MovieInfo: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .fontWeight(.semibold)
            
            Text(value)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .fontWeight(.medium)
        }
    }
}

struct StarsPic: View{
    let name: String
    let pic: Image
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 16){
            
            pic
                .resizable()
                .frame(width: 76,height: 76)
                .cornerRadius(100)
            
            
            Text(name)
                .foregroundColor(.gray)
                .font(.system(size: 15))
            
            
        }
        
    }
}



