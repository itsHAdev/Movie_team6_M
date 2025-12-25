
//  Created by Saja Khalid on 04/07/1447 AH.
//

import SwiftUI


struct HomeView: View {

    public let pagePadding: CGFloat = 6
    @StateObject private var vm = HomeViewModel()
    
    private var headerView: some View {
        HStack {

            Text("Movies Center")
                .font(.largeTitle.bold())

            Spacer()

            Button {
                // فتح صفحة البروفايل لاحقًا
            } label: {

                if let profileImage = UIImage(named: "profile") {

                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())

                } else {

                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.yellow)   // 👈 هذا المهم
                }
            }        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }
    
    var body: some View {
        NavigationStack {

            VStack(spacing: 16) {

                // 🔝 HEADER (ثابت)
                headerView

                // 🔍 SEARCH (ثابت)
                SearchBarView(text: $vm.searchText)
                    .padding(.horizontal, pagePadding)

                // ⬇️ CONTENT (يسكرول)
                ScrollView {
                    VStack(spacing: 34) {

                        TopRatedSection(movies: vm.topRatedMovies)

                        ForEach(vm.categories, id: \.self) { category in
                            CategorySection(
                                title: category,
                                movies: vm.moviesByCategory[category] ?? []
                            )
                        }
                    }
                    .padding(.horizontal, pagePadding)
                    .padding(.bottom, 24)
                }
            }
            .navigationBarHidden(true) // ❌ نلغي الـ NavigationBar
        }
    }
}




//////////////////////////////////////////////////////
// MARK: - Reusable Components
//////////////////////////////////////////////////////

// MARK: Section Header (Title + optional Show More)

struct SectionHeaderView: View {
    
    let title: String
    var showMoreAction: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()

        }
    }}

// MARK: Search Bar

struct SearchBarView: View {

    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search for movies, actors...", text: $text)
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .cornerRadius(14)
    }
}

//////////////////////////////////////////////////////
// MARK: - Movie Cards
//////////////////////////////////////////////////////

// MARK: Single Movie Card (Used in Categories & Grid)

struct MovieCardView: View {

    let movie: Movie

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            // 🎞 Poste
            Image(movie.image)
                .resizable()
                .scaledToFill()
                .frame(width: 258, height: 296)
                .clipped()
                .cornerRadius(14)

            .foregroundColor(.white)
            .padding(8)
        }

    }
}


// MARK: - Top Rated Section (Hero Carousel)

struct TopRatedSection: View {
    public let pagePadding: CGFloat = 6
    
    let movies: [Movie]
    
    private let cardHeight: CGFloat = 455
    private let sidePeek: CGFloat = 6
    private let spacing: CGFloat = 11
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text("High Rated")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding(.horizontal, pagePadding)
            
            GeometryReader { geo in
                let cardWidth = geo.size.width - (sidePeek * 4)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: spacing) {
                        ForEach(movies) { movie in
                            
                            NavigationLink {
                                DetailsView(movie: movie)
                            } label: {
                                ZStack(alignment: .bottomLeading) {
                                    
                                    // 🎬 Poster
                                    Image(movie.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: cardWidth, height: cardHeight)
                                        .clipped()
                                    
                                    // 📝 Overlay Info
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(movie.title)
                                            .font(.largeTitle.bold())
                                        
                                        RatingStarsView(rating: movie.rating)
                                        
                                        (
                                            Text(String(format: "%.1f", movie.rating))
                                                .font(.title3.bold())
                                            +
                                            Text(" out of 5")
                                                .font(.subheadline)
                                        )
                                        
                                        Text("Action · 2h 9min")
                                            .font(.subheadline)
                                            .opacity(0.8)
                                    }
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(
                                        LinearGradient(
                                            colors: [.black.opacity(0.5), .clear],
                                            startPoint: .bottom,
                                            endPoint: .top
                                        )
                                    )
                                }
                                .cornerRadius(12)
                                .scrollTargetLayout() // 📌 مهم للـ snap
                            }}
                        }
                        .padding(.horizontal, sidePeek)
                    }
                    .scrollTargetBehavior(.viewAligned) // pin the last post in scrolling
                }
                .frame(height: cardHeight)
            }
        }
    }

//////////////////////////////////////////////////////
// MARK: - Rating Stars
//////////////////////////////////////////////////////

struct RatingStarsView: View {

    let rating: Double
    private let maxRating: Int = 5
    private let size: CGFloat = 16
    private let spacing: CGFloat = 2

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(1...maxRating, id: \.self) { index in
                starImage(for: index)
                    .font(.system(size: size))
                    .foregroundColor(.yellow)
            }
        }
    }

    @ViewBuilder
    private func starImage(for index: Int) -> some View {
        if rating >= Double(index) {
            Image(systemName: "star.fill")
        } else if rating >= Double(index) - 0.5 {
            Image(systemName: "star.leadinghalf.filled")
        } else {
            Image(systemName: "star")
        }
    }
}

//////////////////////////////////////////////////////
// MARK: - Category Section
//////////////////////////////////////////////////////

struct CategorySection: View {

    let title: String
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            // Header + Show More
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)

                Spacer()

                NavigationLink {
                    CategoryMoviesView(title: title, movies: movies)
                } label: {
                    Text("Show More")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)
                }
            }
            .padding(.horizontal, 6)

            // Horizontal Cards
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(movies) { movie in
                        NavigationLink {
                            DetailsView(movie: movie)
                        } label: {
                            MovieCardView(movie: movie)
                        }
                        .buttonStyle(.plain) // 👈 عشان ما يغيّر الشكل
                    }

                }
//                .padding(.top, 6)
            }
            
        }
        .padding(.top, 36)

    }
    
}
#Preview {
    HomeView()
}
