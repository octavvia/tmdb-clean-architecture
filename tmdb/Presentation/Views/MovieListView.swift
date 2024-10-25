//
//  MovieListView.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/Views/MovieListView.swift

//import SwiftUI
//
//struct MovieListView: View {
//    @StateObject private var viewModel: MovieListViewModel
//
//    init(viewModel: MovieListViewModel) {
//        _viewModel = StateObject(wrappedValue: viewModel)
//    }
//
//    var body: some View {
//        NavigationView {
//            Group {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                } else {
//                    List(viewModel.movies) { movie in
//                        NavigationLink(destination: createDetailView(for: movie.id)) {
//                            HStack {
//                                if let posterPath = movie.posterPath,
//                                   let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
//                                    AsyncImage(url: url) { image in
//                                        image
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                    } placeholder: {
//                                        ProgressView()
//                                    }
//                                    .frame(width: 100, height: 150)
//                                }
//                                VStack(alignment: .leading, spacing: 5) {
//                                    Text(movie.title)
//                                        .font(.headline)
//                                    Text(movie.overview)
//                                        .font(.subheadline)
//                                        .lineLimit(3)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Min-Watch Playlist")
//            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Cari Film")
//        }
//    }
//    
//    // Fungsi untuk membuat Detail View dengan ViewModel yang diperlukan
//    @ViewBuilder
//    private func createDetailView(for movieId: Int) -> some View {
//        let tmdbService = TMDBService()
//        let movieRepository = MovieRepositoryImpl(tmdbService: tmdbService)
//        let getMovieDetailUseCase = GetMovieDetailUseCase(repository: movieRepository)
//        let getMovieVideosUseCase = GetMovieVideosUseCase(repository: movieRepository)
//        let detailViewModel = MovieDetailViewModel(getMovieDetailUseCase: getMovieDetailUseCase)
//        MovieDetailView(movieId: movieId, viewModel: detailViewModel)
//    }
//}

//// Presentation/Views/MovieListView.swift
//
//import SwiftUI
//import Kingfisher
//
//struct MovieListView: View {
//    @ObservedObject var viewModel: MovieListViewModel
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Search Bar
//                SearchBar(text: $viewModel.searchText)
//                    .padding(.horizontal)
//                
//                // Movie List
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                        .padding()
//                } else {
//                    List(viewModel.movies) { movie in
//                        HStack(alignment: .top) {
//                            if let posterPath = movie.posterPath,
//                               let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
//                                KFImage(url)
//                                    .resizable()
//                                    .placeholder {
//                                        Image(systemName: "photo")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 50, height: 75)
//                                    }
//                                    .cancelOnDisappear(true)
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 75)
//                            } else {
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 50, height: 75)
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
//                    .listStyle(PlainListStyle())
//                }
//            }
//            .navigationTitle("Popular Movies")
//            .alert(item: $viewModel.errorMessage) { errorMessage in
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//}

// Presentation/Views/MovieListView.swift

//import SwiftUI
//import Kingfisher
//
//struct MovieListView: View {
//    @ObservedObject var viewModel: MovieListViewModel
//    let getMovieDetailUseCase: GetMovieDetailUseCase
//    // let getMovieVideosUseCase: GetMovieVideosUseCase // Dihapus karena tidak digunakan
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Search Bar
//                SearchBar(text: $viewModel.searchText)
//                    .padding(.horizontal)
//                
//                // Movie List
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                        .padding()
//                } else {
//                    List(viewModel.movies) { movie in
//                        NavigationLink(destination: createDetailView(for: movie)) {
//                            HStack(alignment: .top) {
//                                if let posterPath = movie.posterPath,
//                                   let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
//                                    KFImage(url)
//                                        .resizable()
//                                        .placeholder {
//                                            Image(systemName: "photo")
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .frame(width: 50, height: 75)
//                                                .foregroundColor(.gray)
//                                        }
//                                        .cancelOnDisappear(true)
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 50, height: 75)
//                                        .cornerRadius(4)
//                                } else {
//                                    Image(systemName: "photo")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 50, height: 75)
//                                        .foregroundColor(.gray)
//                                }
//                                VStack(alignment: .leading, spacing: 5) {
//                                    Text(movie.title)
//                                        .font(.headline)
//                                    Text(movie.overview)
//                                        .font(.subheadline)
//                                        .foregroundColor(.secondary)
//                                        .lineLimit(3)
//                                }
//                            }
//                            .padding(.vertical, 5)
//                        }
//                    }
//                    .listStyle(PlainListStyle())
//                }
//            }
//            .navigationTitle("Popular Movies")
//            .alert(item: $viewModel.errorMessage) { errorMessage in
//                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//            }
//        }
//    }
//    
//    // Fungsi untuk membuat Detail View dengan ViewModel yang diperlukan
//    @ViewBuilder
//    private func createDetailView(for movie: Movie) -> some View {
//        let detailViewModel = MovieDetailViewModel(
//            getMovieDetailUseCase: getMovieDetailUseCase,
//            movieId: movie.id
//        )
//        MovieDetailView(viewModel: detailViewModel)
//    }
//}


// Presentation/Views/MovieListView.swift

import SwiftUI
import Kingfisher

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    let getMovieDetailUseCase: GetMovieDetailUseCase
    // let getMovieVideosUseCase: GetMovieVideosUseCase // Dihapus karena tidak digunakan
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                
                // Movie List
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: createDetailView(for: movie)) {
                            HStack(alignment: .top) {
                                if let posterPath = movie.posterPath,
                                   let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
                                    KFImage(url)
                                        .resizable()
                                        .placeholder {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 75)
                                                .foregroundColor(.gray)
                                        }
                                        .cancelOnDisappear(true)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 75)
                                        .cornerRadius(4)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 75)
                                        .foregroundColor(.gray)
                                }
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(movie.title)
                                        .font(.headline)
                                    Text(movie.overview)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(3)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Popular Movies")
            .alert(item: $viewModel.errorMessage) { errorMessage in
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // Fungsi untuk membuat Detail View dengan ViewModel yang diperlukan
    @ViewBuilder
    private func createDetailView(for movie: Movie) -> some View {
        let detailViewModel = MovieDetailViewModel(
            getMovieDetailUseCase: getMovieDetailUseCase,
            movieId: movie.id
        )
        MovieDetailView(viewModel: detailViewModel)
    }
}





