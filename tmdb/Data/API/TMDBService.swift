//
//  TMDBService.swift
//  tmdb
//
//  Created by Aulia Octaviani on 24/10/24.
//

// Data/API/TMDBService.swift
import Foundation

struct TMDBService {
    private let apiKey = "6d0f6680c900ce71d6f46bec0199d7b9"
    private let baseURL = "https://api.themoviedb.org/3"
    
    // Existing method
    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // New method for fetching movie details
    func fetchMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        let urlString = "\(baseURL)/movie/\(movieId)?api_key=\(apiKey)&language=en-US"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: data)
                completion(.success(movieDetail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

// Tambahkan model untuk MovieDetail
struct MovieDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let runtime: Int?
    let genres: [Genre]
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime, genres
        case voteAverage = "vote_average"
    }
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}

// Data/API/TMDBService.swift

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case unknown
}
