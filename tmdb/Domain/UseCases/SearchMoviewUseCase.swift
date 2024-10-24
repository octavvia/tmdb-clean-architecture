//
//  SearchMoviewUseCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Domain/UseCases/SearchMoviesUseCase.swift

import Foundation

public class SearchMoviesUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    public func execute(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.searchMovies(query: query, completion: completion)
    }
}


