//
//  MovieDetailViewModel.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Presentation/ViewModels/MovieDetailViewModel.swift

import Foundation
import Combine

public class MovieDetailViewModel: ObservableObject {
    @Published public var movieDetail: MovieDetail?
    @Published public var isLoading = false
    @Published public var errorMessage: String?
    
    private let getMovieDetailUseCase: GetMovieDetailUseCase
    private var cancellables = Set<AnyCancellable>()
    
    public init(getMovieDetailUseCase: GetMovieDetailUseCase, movieId: Int) {
        self.getMovieDetailUseCase = getMovieDetailUseCase
        fetchMovieDetail(movieId: movieId)
    }
    
    public func fetchMovieDetail(movieId: Int) {
        isLoading = true
        errorMessage = nil
        getMovieDetailUseCase.execute(movieId: movieId) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movieDetail):
                    self?.movieDetail = movieDetail
                case .failure(let error):
                    self?.handleError(error)
                }
            }
        }
    }
    
    private func handleError(_ error: Error) {
        if let networkError = error as? NetworkError {
            switch networkError {
            case .invalidURL:
                self.errorMessage = "URL tidak valid."
            case .noData:
                self.errorMessage = "Tidak ada data yang diterima."
            case .decodingError:
                self.errorMessage = "Gagal menguraikan data."
            case .unknown:
                self.errorMessage = "Terjadi kesalahan yang tidak diketahui."
            }
        } else {
            self.errorMessage = error.localizedDescription
        }
    }
}



