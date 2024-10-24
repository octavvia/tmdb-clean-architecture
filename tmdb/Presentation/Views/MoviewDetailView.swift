//
//  MoviewDetailView.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/Views/MovieDetailView.swift
import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    let movieId: Int

    init(movieId: Int, viewModel: MovieDetailViewModel) {
        self.movieId = movieId
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let posterPath = viewModel.movieDetail?.posterPath,
                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                if let title = viewModel.movieDetail?.title {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                if let releaseDate = viewModel.movieDetail?.releaseDate {
                    Text("Release Date: \(releaseDate)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if let runtime = viewModel.movieDetail?.runtime {
                    Text("Runtime: \(runtime) minutes")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if let genres = viewModel.movieDetail?.genres {
                    Text("Genres: \(genres.map { $0.name }.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                if let overview = viewModel.movieDetail?.overview {
                    Text(overview)
                        .font(.body)
                }
                
                if let voteAverage = viewModel.movieDetail?.voteAverage {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", voteAverage))
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Movie Detail")
        .onAppear {
            viewModel.fetchMovieDetail(movieId: movieId)
        }
        .overlay(
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        )
        .alert(isPresented: Binding<Bool>(
            get: { viewModel.errorMessage != nil },
            set: { _ in viewModel.errorMessage = nil }
        )) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
