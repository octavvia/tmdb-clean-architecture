//
//  MovieDetailViewModel.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/ViewModels/MovieDetailViewModel.swift
import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let getMovieDetailUseCase: GetMovieDetailUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(getMovieDetailUseCase: GetMovieDetailUseCase) {
        self.getMovieDetailUseCase = getMovieDetailUseCase
    }
    
    func fetchMovieDetail(movieId: Int) {
        isLoading = true
        errorMessage = nil
        getMovieDetailUseCase.execute(movieId: movieId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let detail):
                    self?.movieDetail = detail
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
