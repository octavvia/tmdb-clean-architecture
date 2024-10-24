//
//  MovieRepositoryImpl.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Data/Repositories/MovieRepositoryImpl.swift
import Foundation

class MovieRepositoryImpl: MovieRepository {
    private let tmdbService: TMDBService

    init(tmdbService: TMDBService) {
        self.tmdbService = tmdbService
    }

    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        tmdbService.fetchPopularMovies { result in
            completion(result)
        }
    }
}
