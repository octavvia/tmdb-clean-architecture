//
//  MovieListView.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/ViewModels/MovieListViewModel.swift
import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getPopularMoviesUseCase: GetPopularMoviesUseCase
    private var cancellables = Set<AnyCancellable>()

    init(getPopularMoviesUseCase: GetPopularMoviesUseCase) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
        fetchMovies()
    }

    func fetchMovies() {
        isLoading = true
        errorMessage = nil
        getPopularMoviesUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
