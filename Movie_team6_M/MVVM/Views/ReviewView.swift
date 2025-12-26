//
//  ReviewView.swift
//  Movie_team6_M
//
//  Created by Hadeel Alansari on 25/12/2025.
//

import SwiftUI

struct ReviewView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var rating = 0
    @State private var reviewText = ""
    var body: some View {
        NavigationStack{
            
            VStack(alignment: .leading, spacing: 16){
                
                Text("Review")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                
                TextField("Enter your review", text: $reviewText)
                    .padding(10)
                    .padding(.bottom,100)
                    .frame(width: 358,height: 146)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(8)
                
                HStack(spacing:1.5){
                    Text("Rating")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                    
                    Spacer().frame(width: 165)
                    
                    ForEach(1...5, id: \.self){index in
                        Button{
                            rating = index
                        }label: {
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .foregroundStyle(.yellow)
                                .font(.system(size: 20))
                        }
                    }
                }//h
            }//v
        .padding(.bottom,450)
        .navigationTitle("Write a review")
        .navigationBarTitleDisplayMode(.inline)
        
        
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
                Image(systemName: "checkmark")
                    .foregroundColor(.yellow)
            }
        }
        .navigationBarBackButtonHidden(true)
    }//nav
    }
}

#Preview {
    ReviewView()
}
