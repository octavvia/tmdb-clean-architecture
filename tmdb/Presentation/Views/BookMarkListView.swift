////
////  BookMarkListView.swift
////  tmdb
////
////  Created by Aulia Octaviani on 30/10/24.
////
//
//// Presentation/Views/BookmarkListView.swift
//
//import SwiftUI
//import Kingfisher
//
//struct BookmarkListView: View {
//    @ObservedObject var viewModel: BookmarkListViewModel
//    
//    var body: some View {
//        VStack {
//            if viewModel.bookmarkedMovies.isEmpty {
//                Text("No bookmarked movies.")
//                    .foregroundColor(.gray)
//                    .padding()
//            } else {
//                List(viewModel.bookmarkedMovies) { movie in
//                    NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(
//                        getMovieDetailUseCase: viewModel.getMovieDetailUseCase,
//                        movieId: movie.id
//                    ))) {
//                        HStack(alignment: .top) {
//                            if let posterPath = movie.posterPath,
//                               let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
//                                KFImage(url)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 75)
//                                    .cornerRadius(4)
//                            } else {
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 75)
//                                    .foregroundColor(.gray)
//                            }
//                            VStack(alignment: .leading, spacing: 5) {
//                                Text(movie.title)
//                                    .font(.headline)
//                                Text(movie.overview)
//                                    .font(.subheadline)
//                                    .foregroundColor(.secondary)
//                                    .lineLimit(3)
//                            }
//                        }
//                        .padding(.vertical, 5)
//                    }
//                }
//                .listStyle(PlainListStyle())
//            }
//        }
//        .navigationTitle("Bookmarked Movies")
//    }
//}
