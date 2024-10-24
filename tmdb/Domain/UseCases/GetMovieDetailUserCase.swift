//
//  GetMovieDetailUserCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Domain/UseCases/GetMovieDetailUseCase.swift

import Foundation

public class GetMovieDetailUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        repository.getMovieDetail(movieId: movieId, completion: completion)
    }
}
