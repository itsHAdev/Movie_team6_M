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
                VStack(alignment: .leading, spacing: 30) {

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

                    //MARK: - Reviews
                    
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
                    
                    //MARK: - ReviewCard
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                          ZStack{
                             Color.gray.opacity(0.2)
                            .frame(width: 305,height: 188)
                              
                            VStack(alignment: .leading,spacing: 12){
                                                               
                                HStack{
                                    Color.white
                                    .frame(width: 38,height: 38)
                                    .cornerRadius(100)
                                                
                            VStack(alignment: .leading, spacing: 8){
                                    Text("name name")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13))
                                    .fontWeight(.medium)
                                                                       
                            HStack{
                                    ForEach(0..<5) { _ in
                                    Image(systemName: "star.fill")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.yellow)
                    }
                       }//h
                            }//v
                                }//h
                                                               
                         Text("This is an engagingly simple, good-hearted film, with just enough darkness around the edges to give contrast and relief to its glowingly benign view of human nature.")
                                    .frame(width: 250,height: 80)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 13))
                                                               
                        Text("Day")
                            .foregroundStyle(.gray)
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .padding(.leading,240)
                                
                                }//v1
                            .padding(.leading, -30)
                                                           
                                    }//z
                                }//hCard
                    }//scrollView
                    
                    
                    NavigationLink{
                        ReviewView()
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 357,height: 48)
                                .foregroundStyle(Color.black)
                                .cornerRadius(8)
                                .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.yellow, lineWidth: 1)
                                        )
                            
                            HStack{
                                Image(systemName: "square.and.pencil")
                                    .foregroundStyle(.yellow)
                                    .font(.system(size: 16))
                                
                                Text("Write a review")
                                    .foregroundStyle(.yellow)
                                    .font(.system(size: 16))
                            }//h
                        }//z
                    }//b
                    
                    Spacer().frame(height: 30)
                }//v
                .padding(.horizontal, 16)
                .padding(.top, 200)
            }//zMain
        }//scrollView
        .ignoresSafeArea()

        //MARK: - Toolbar
        
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

struct ReviewCard: View {
    let text: String
    let rating: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // النجوم
            HStack(spacing: 2) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 16))
                }
            }

            // نص الريفيو
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 15))
        }
        .padding()
        .background(Color.gray.opacity(0.25))
        .cornerRadius(12)
    }
}

