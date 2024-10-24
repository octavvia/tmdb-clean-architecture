//
//  GetMovieVideosUseCase.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Domain/UseCases/GetMovieVideosUseCase.swift

import Foundation

public class GetMovieVideosUseCase {
    private let repository: MovieRepository

    init(repository: MovieRepository) {
        self.repository = repository
    }

    func execute(movieId: Int, completion: @escaping (Result<[Video], Error>) -> Void) {
        repository.getMovieVideos(movieId: movieId, completion: completion)
    }
}
