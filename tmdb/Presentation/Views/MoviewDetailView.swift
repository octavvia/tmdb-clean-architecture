//
//  MoviewDetailView.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

//// Presentation/Views/MovieDetailView.swift
//import SwiftUI
//
//struct MovieDetailView: View {
//    @StateObject private var viewModel: MovieDetailViewModel
//    let movieId: Int
//    
//    init(movieId: Int, viewModel: MovieDetailViewModel) {
//        self.movieId = movieId
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 16) {
//                if let posterPath = viewModel.movieDetail?.posterPath,
//                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
//                    AsyncImage(url: url) { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                    } placeholder: {
//                        ProgressView()
//                    }
//                }
//                
//                if let title = viewModel.movieDetail?.title {
//                    Text(title)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                }
//                
//                if let releaseDate = viewModel.movieDetail?.releaseDate {
//                    Text("Release Date: \(releaseDate)")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                
//                if let runtime = viewModel.movieDetail?.runtime {
//                    Text("Runtime: \(runtime) minutes")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                
//                if let genres = viewModel.movieDetail?.genres {
//                    Text("Genres: \(genres.map { $0.name }.joined(separator: ", "))")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                
//                if let overview = viewModel.movieDetail?.overview {
//                    Text(overview)
//                        .font(.body)
//                }
//                
//                if let voteAverage = viewModel.movieDetail?.voteAverage {
//                    HStack {
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                        Text(String(format: "%.1f", voteAverage))
//                    }
//                }
//                
//                Spacer()
//            }
//            .padding()
//        }
//        .navigationTitle("Movie Detail")
//        .onAppear {
//            viewModel.fetchMovieDetail(movieId: movieId)
//        }
//        .overlay(
//            Group {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                }
//            }
//        )
//        .alert(isPresented: Binding<Bool>(
//            get: { viewModel.errorMessage != nil },
//            set: { _ in viewModel.errorMessage = nil }
//        )) {
//            Alert(
//                title: Text("Error"),
//                message: Text(viewModel.errorMessage ?? "Unknown error"),
//                dismissButton: .default(Text("OK"))
//            )
//        }
//    }
    //}
    
    // Presentation/Views/MovieDetailView.swift
    
    //import SwiftUI
    //import WebKit
    //
    //struct MovieDetailView: View {
    //    @StateObject private var viewModel: MovieDetailViewModel
    //    let movieId: Int
    //
    //    init(movieId: Int, viewModel: MovieDetailViewModel) {
    //        self.movieId = movieId
    //        _viewModel = StateObject(wrappedValue: viewModel)
    //    }
    //
    //    var body: some View {
    //        ScrollView {
    //            VStack(alignment: .leading, spacing: 16) {
    //                if let posterPath = viewModel.movieDetail?.posterPath,
    //                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
    //                    AsyncImage(url: url) { image in
    //                        image
    //                            .resizable()
    //                            .aspectRatio(contentMode: .fit)
    //                    } placeholder: {
    //                        ProgressView()
    //                    }
    //                }
    //
    //                if let title = viewModel.movieDetail?.title {
    //                    Text(title)
    //                        .font(.largeTitle)
    //                        .fontWeight(.bold)
    //                }
    //
    //                if let releaseDate = viewModel.movieDetail?.releaseDate {
    //                    Text("Release Date: \(releaseDate)")
    //                        .font(.subheadline)
    //                        .foregroundColor(.gray)
    //                }
    //
    //                if let runtime = viewModel.movieDetail?.runtime {
    //                    Text("Runtime: \(runtime) minutes")
    //                        .font(.subheadline)
    //                        .foregroundColor(.gray)
    //                }
    //
    //                if let genres = viewModel.movieDetail?.genres {
    //                    Text("Genres: \(genres.map { $0.name }.joined(separator: ", "))")
    //                        .font(.subheadline)
    //                        .foregroundColor(.gray)
    //                }
    //
    //                if let overview = viewModel.movieDetail?.overview {
    //                    Text(overview)
    //                        .font(.body)
    //                }
    //
    //                if let voteAverage = viewModel.movieDetail?.voteAverage {
    //                    HStack {
    //                        Image(systemName: "star.fill")
    //                            .foregroundColor(.yellow)
    //                        Text(String(format: "%.1f", voteAverage))
    //                    }
    //                }
    //
    //                if !viewModel.videos.isEmpty {
    //                    Text("Trailer")
    //                        .font(.headline)
    //                        .padding(.top)
    //
    //                    ForEach(viewModel.videos) { video in
    //                        if video.site.lowercased() == "youtube" {
    //                            YouTubePlayerView(videoID: video.key)
    //                                .frame(height: 200)
    //                        }
    //                    }
    //                }
    //
    //                Spacer()
    //            }
    //            .padding()
    //        }
    //        .navigationTitle("Movie Detail")
    //        .onAppear {
    //            viewModel.fetchMovieDetail(movieId: movieId)
    //        }
    //        .overlay(
    //            Group {
    //                if viewModel.isLoading {
    //                    ProgressView("Loading...")
    //                }
    //            }
    //        )
    //        .alert(isPresented: Binding<Bool>(
    //            get: { viewModel.errorMessage != nil },
    //            set: { _ in viewModel.errorMessage = nil }
    //        )) {
    //            Alert(
    //                title: Text("Error"),
    //                message: Text(viewModel.errorMessage ?? "Unknown error"),
    //                dismissButton: .default(Text("OK"))
    //            )
    //        }
    //    }
    //}
    //
    //// YouTubePlayerView.swift
    //
    //struct YouTubePlayerView: UIViewRepresentable {
    //    let videoID: String
    //
    //    func makeUIView(context: Context) -> WKWebView {
    //        return WKWebView()
    //    }
    //
    //    func updateUIView(_ uiView: WKWebView, context: Context) {
    //        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
    //        uiView.load(URLRequest(url: url))
    //    }
    //}
//}

// MovieDetailView.swift

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Poster Image
                if let posterPath = viewModel.movieDetail?.posterPath,
                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .foregroundColor(.gray)
                }
                
                // Title
                Text(viewModel.movieDetail?.title ?? "Unknown Title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                // Overview
                Text(viewModel.movieDetail?.overview ?? "No overview available.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                
                // Tambahkan informasi tambahan jika ada
                // Contoh:
                // Text("Release Date: \(viewModel.movieDetail?.releaseDate ?? "N/A")")
                // Text("Rating: \(viewModel.movieDetail?.voteAverage ?? 0)/10")
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(viewModel.movieDetail?.title ?? "Detail")
        .navigationBarTitleDisplayMode(.inline)
        .alert(item: $viewModel.errorMessage) { errorMessage in
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}


