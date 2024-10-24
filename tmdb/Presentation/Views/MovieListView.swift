//
//  MovieListView.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/Views/MovieListView.swift
import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.movies) { movie in
                        HStack {
                            if let posterPath = movie.posterPath,
                               let url = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)") {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 150)
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(movie.title)
                                    .font(.headline)
                                Text(movie.overview)
                                    .font(.subheadline)
                                    .lineLimit(3)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}


//#Preview{
//    MovieListView()
//}
