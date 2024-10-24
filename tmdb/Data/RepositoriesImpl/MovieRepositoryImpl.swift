//
//  MovieRepositoryImpl.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//


// Data/Repositories/MovieRepositoryImpl.swift


import Foundation

public class MovieRepositoryImpl: MovieRepository {
    private let tmdbService: TMDBService

    public init(tmdbService: TMDBService) {
        self.tmdbService = tmdbService
    }

    public func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        tmdbService.fetchPopularMovies { result in
            completion(result)
        }
    }

    public func getMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        tmdbService.fetchMovieDetail(movieId: movieId, completion: completion)
    }

    public func getMovieVideos(movieId: Int, completion: @escaping (Result<[Video], Error>) -> Void) {
        tmdbService.fetchMovieVideos(movieId: movieId, completion: completion)
    }

    public func searchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        tmdbService.searchMovies(query: query, completion: completion)
    }
}



