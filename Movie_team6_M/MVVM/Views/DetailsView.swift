//
//  DetailsView.swift
//  Movie_team6_M
//
//  Created by Hadeel Alansari on 24/12/2025.
//aaa


import SwiftUI

struct DetailsView: View {
    var body: some View {
        NavigationStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ZStack(alignment: .topLeading) {
                    
                    //MARK: - Pic
                    
                    Image("Image1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 444)
                        .clipped()
                        .ignoresSafeArea(edges: .top)
                    
                    LinearGradient(
                        colors: [.black.opacity(1),.white.opacity(0.2)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(width: 400, height: 444)
                    
                    VStack(alignment: .leading, spacing: 30) {
                        
                        Spacer().frame(height: 120)
                        
                        Text("Movie name")
                            .foregroundColor(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        //MARK: - MovieInfo
                        
                        HStack(spacing: 180) {
                            MovieInfo(title: "Duration", value: "Time")
                            MovieInfo(title: "Language", value: "Language")
                        }
                        
                        HStack(spacing: 200) {
                            MovieInfo(title: "Genre", value: "Genre")
                            MovieInfo(title: "Age", value: "Age")
                        }
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Story")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            Text("Synopsis. In 1947, Andy Dufresne (Tim Robbins), a banker in Maine, is convicted of murdering his wife and her lover, a golf pro. Since the state of Maine has no death penalty, he is given two consecutive life sentences and sent to the notoriously harsh Shawshank Prison.")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .frame(width: 346 ,height: 126)
                        }
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("IMDb Rating")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            Text("10/10")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }
                        
                        Color.gray
                            .frame(width: 358,height: 0.5)
                        
                        VStack(alignment: .leading, spacing: 16){
                            
                            Text("Director")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            Color.gray
                                .frame(width: 76,height: 76)
                                .cornerRadius(100)
                            
                            Text("name name")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                            
                        }//v
                        
                        VStack(alignment: .leading, spacing: 16){
                            Text("Stars")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 24) {
                                ForEach(0..<3) { _ in
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Color.gray
                                            .frame(width: 76, height: 76)
                                            .cornerRadius(100)
                                        
                                        Text("name name")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                    }//v
                                }
                            }//h
                        }//v
                            Spacer().frame(height: 12)
                            
                            Color.gray
                                .frame(width: 358,height: 0.5)
                            
                            
                            VStack(alignment: .leading, spacing: 16){
                                
                                Text("Rating  & Reviews ")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                                Text("4.8")
                                    .foregroundStyle(Color.gray)
                                    .font(.system(size: 39))
                                    .fontWeight(.semibold)
                                
                                Text("out of 5")
                                    .foregroundStyle(Color.gray)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }//v
                 
                        
                        
                    }
                    .padding(.leading, 16)
                    .padding(.top, 200)
                }//z
            }//scroll
            .ignoresSafeArea(.all)
            
            //MARK: - Toolbar
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.yellow)
                        
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.yellow)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bookmark")
                            .foregroundColor(.yellow)
                    }
                }
            }//toolbar
        }//nav
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

#Preview {
    DetailsView()
        .preferredColorScheme(.dark)
}
