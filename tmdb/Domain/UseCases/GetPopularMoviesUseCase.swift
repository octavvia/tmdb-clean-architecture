//
//  GetPopularMoviesUseCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Domain/UseCases/GetPopularMoviesUseCase.swift
import Foundation

class GetPopularMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getPopularMovies { result in
            completion(result)
        }
    }
}
